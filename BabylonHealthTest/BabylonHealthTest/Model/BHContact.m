#import "BHContact.h"
#import "BHContactDetails.h"
#import "BHCoreDataManager.h"

static NSString *const kContactIdProperty = @"contactId";
static NSString *const kContactIdKey = @"id";

@interface BHContact ()

// Private interface goes here.

@end

@implementation BHContact

+ (NSArray *)updateContactsWithContacts:(NSArray *)contactsArray {
    if (contactsArray.count > 0) {
        //Get contacts with matching IDs from database
        NSArray *keysArray = [contactsArray valueForKeyPath:kContactIdKey];
        
        NSMutableArray *mutableArray = [NSMutableArray new];
        NSArray *matchingContactsArray = [BHCoreDataManager retrieveMatchingEntitiesFromDatabaseWithName:[self entityName] keysArray:keysArray keyName:kContactIdProperty];
        
        int i = 0;
        //Update or insert card type in the database
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
        [BHCoreDataManager removeEntitiesFromDatabaseWithName:[self entityName] notInKeysArray:keysArray keyName:kContactIdProperty];
        
        [BHCoreDataManager saveContext];
    }
    return [BHCoreDataManager getContacts];
}

- (void)populateContactWithDictionary:(NSDictionary *)contactDictionary {
    self.contactId = contactDictionary[@"id"];
    self.firstName = contactDictionary[@"first_name"];
    self.lastName = contactDictionary[@"surname"];
    BHContactDetails *contactDetails = [BHContactDetails contactDetailsFromContactDetailsDictionary:contactDictionary];
    contactDetails.contact = self;
    self.contactDetails = contactDetails;
    self.avatarURL = [NSString stringWithFormat:@"http://api.adorable.io/avatar/100/%@",self.contactDetails.email];
}

@end
