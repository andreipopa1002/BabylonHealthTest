#import "_Contact.h"

extern NSString *const kContactIdProperty;
extern NSString *const kContactIdKey;

@interface BHContact : _Contact {}

- (void)populateContactWithDictionary:(NSDictionary *)contactDictionary;

@end
