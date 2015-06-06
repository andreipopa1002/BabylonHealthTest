#import "BHContactDetails.h"
#import "BHCoreDataManager.h"

@implementation BHContactDetails

- (void)populateWithContactDetailsDictionary:(NSDictionary *)contactDetailsDictionary {
    self.address = contactDetailsDictionary[@"address"];
    self.phoneNumber = contactDetailsDictionary[@"phone_number"];
    self.email = contactDetailsDictionary[@"email"];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    self.createdAt = [formater dateFromString:contactDetailsDictionary[@"createdAt"]];
    self.updatedAt = [formater dateFromString:contactDetailsDictionary[@"updatedAt"]];
}

@end
