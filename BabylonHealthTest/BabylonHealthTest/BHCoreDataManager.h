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
/**
 *  This class will work as a wrapper on top of CoreData and our model classes
 */
@interface BHCoreDataManager : NSObject
/**
 *  will update the existing entries with the new date received from the API
 *
 *  @param contactsArray received from the API
 *
 *  @return array with BHContact objects
 */
+ (NSArray *)updateContactsWithContacts:(NSArray *)contactsArray;
/**
 *  will return the entries from CoreData
 *
 *  @return array with BHContact objects
 */
+ (NSArray *)getContacts;

/**
 *  Requests a new, blank BHContact object from CoreData
 *
 *  @return BHContact object from CoreData
 */
+ (BHContact *)contactObject;
/**
 *  Requests a new BHContactDetails object from CoreData
 *
 *  @return BHContactDetails from CoreData
 */
+ (BHContactDetails *)contactDetailsObject;

@end
