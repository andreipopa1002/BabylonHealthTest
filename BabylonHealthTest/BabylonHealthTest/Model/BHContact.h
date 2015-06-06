#import "_Contact.h"

extern NSString *const kContactIdProperty;
extern NSString *const kContactIdKey;

@interface BHContact : _Contact {}
/**
 *  This method will populate a BHContact
 *
 *  @param contactDictionary dictionary received from the API
 */
- (void)populateContactWithDictionary:(NSDictionary *)contactDictionary;

@end
