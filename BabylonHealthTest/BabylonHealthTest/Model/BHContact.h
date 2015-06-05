//
//  Contact.h
//  
//
//  Created by Popa Andrei on 05/06/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BHContactDetails;

@interface BHContact : NSManagedObject

@property (nonatomic, retain) NSString * avatarURL;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) BHContactDetails *contactDetails;

@end
