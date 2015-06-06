//
//  BHCoreDataManager.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHCoreDataManager.h"
#import <CoreData/CoreData.h>
#import "BHContact.h"
#import "BHContactDetails.h"

@interface BHCoreDataManager()

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation BHCoreDataManager

+ (instancetype)sharedManager {
    static BHCoreDataManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [BHCoreDataManager new];
    });
    return _sharedManager;
}

+ (BHContact *)contactObject {
    return [NSEntityDescription insertNewObjectForEntityForName:[BHContact entityName] inManagedObjectContext:[BHCoreDataManager sharedManager].managedObjectContext];
}

+ (BHContactDetails *)contactDetailsObject {
    return [NSEntityDescription insertNewObjectForEntityForName:[BHContactDetails entityName] inManagedObjectContext:[BHCoreDataManager sharedManager].managedObjectContext];
}

+ (NSArray *)retrieveMatchingEntitiesFromDatabaseWithName:(NSString *)entityName keysArray:(NSArray *)keysArray keyName:(NSString *)keyName  {
    if (!keysArray) return nil;
    
    NSManagedObjectContext *context = [BHCoreDataManager sharedManager].managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:keyName ascending:YES]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"%@ in (%%@)", keyName], keysArray];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *resultsArray = [context executeFetchRequest:fetchRequest error:&error];
    return resultsArray;
}

+ (NSArray *)removeEntitiesFromDatabaseWithName:(NSString *)entityName notInKeysArray:(NSArray *)keysArray keyName:(NSString *)keyName  {
    NSManagedObjectContext *context = [BHCoreDataManager sharedManager].managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    if (keysArray && keyName) {
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:keyName ascending:YES]];
        fetchRequest.predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"not (%@ in (%%@))", keyName], keysArray];
    }
    
    NSError *error;
    NSArray *resultsArray = [context executeFetchRequest:fetchRequest error:&error];
    NSArray *idsToDelete = nil;
    if (keysArray && keyName) {
        idsToDelete = [resultsArray valueForKeyPath:keyName];
    }
    
    for (NSManagedObject *info in resultsArray) {
        [context deleteObject:info];
    }
    
    return ![context save:&error] ? nil : idsToDelete;
}

+ (NSArray *)getContacts {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSError *error;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:[BHContact entityName] inManagedObjectContext:[BHCoreDataManager sharedManager].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    return [[BHCoreDataManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

+ (NSArray *)updateContactsWithContacts:(NSArray *)contactsArray {
    if (contactsArray.count > 0) {
        //Get contacts with matching IDs from database
        NSArray *keysArray = [contactsArray valueForKeyPath:kContactIdKey];
        
        NSMutableArray *mutableArray = [NSMutableArray new];
        NSArray *matchingContactsArray = [BHCoreDataManager retrieveMatchingEntitiesFromDatabaseWithName:[BHContact entityName] keysArray:keysArray keyName:kContactIdProperty];
        
        int i = 0;
        //Update or insert contact in the database
        for (NSDictionary *contactDictionary in contactsArray) {
            BHContact *contact;
            if (matchingContactsArray.count > i && [contactDictionary[kContactIdKey] compare:((BHContact *)matchingContactsArray[i]).contactId] == NSOrderedSame){
                contact = matchingContactsArray[i];
                [contact populateContactWithDictionary:contactDictionary];
                i++;
            } else {
                contact = [BHCoreDataManager contactObject];
                [contact populateContactWithDictionary:contactDictionary];
            }
            [mutableArray addObject:contact];
        }
        // remove cardTypes that don't exist anymore
        [BHCoreDataManager removeEntitiesFromDatabaseWithName:[BHContact entityName] notInKeysArray:keysArray keyName:kContactIdProperty];
        
        [BHCoreDataManager saveContext];
    }
    return [BHCoreDataManager getContacts];
}

+ (void)saveContext {
    [[BHCoreDataManager sharedManager] saveContext];
}


#pragma mark - Core Data stack
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Home.BabylonHealthTest" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BabylonHealthTest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BabylonHealthTest.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
