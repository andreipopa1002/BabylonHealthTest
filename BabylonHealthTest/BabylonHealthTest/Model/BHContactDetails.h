//
//  ContactDetails.h
//  
//
//  Created by Popa Andrei on 05/06/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BHContact;

@interface BHContactDetails : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) BHContact *contact;

@end
