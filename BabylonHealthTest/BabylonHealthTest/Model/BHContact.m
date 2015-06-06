#import "BHContact.h"
#import "BHContactDetails.h"
#import "BHCoreDataManager.h"

NSString *const kContactIdProperty = @"contactId";
NSString *const kContactIdKey = @"id";

@implementation BHContact

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
