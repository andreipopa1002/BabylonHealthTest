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

+ (NSArray *)updateContactsWithContacts:(NSArray *)contactsArray;
+ (NSArray *)getContacts;

+ (BHContact *)contactObject;
+ (BHContactDetails *)contactDetailsObject;

@end
