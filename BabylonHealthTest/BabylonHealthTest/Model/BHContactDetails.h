#import "_ContactDetails.h"

@interface BHContactDetails : _ContactDetails {}
/**
 *  This method will populate the BHContactDetails object
 *
 *  @param contactDetailsDictionary dictionary received from the API
 */
- (void)populateWithContactDetailsDictionary:(NSDictionary *)contactDetailsDictionary;

@end
