//
//  BHCoreDataManager.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BHContact;
@class BHContactDetails;

@interface BHCoreDataManager : NSObject

+ (NSArray *)retrieveMatchingEntitiesFromDatabaseWithName:(NSString *)entityName keysArray:(NSArray *)keysArray keyName:(NSString *)keyName;
+ (NSArray *)removeEntitiesFromDatabaseWithName:(NSString *)entityName notInKeysArray:(NSArray *)keysArray keyName:(NSString *)keyName;
+ (void)saveContext;

+ (BHContact *)contactObject;
+ (BHContactDetails *)contactDetailsObject;
+ (NSArray *)getContacts;

@end
