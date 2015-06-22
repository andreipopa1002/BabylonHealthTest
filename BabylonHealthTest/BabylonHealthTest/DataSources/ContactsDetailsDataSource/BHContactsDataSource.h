//
//  BHContactsDataSource.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 06/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHContact.h"
@import UIKit;
/**
 *  This class will act as the data source for a table view that displays contacts
 */
@interface BHContactsDataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *contacts;
/**
 *  This method will tell the data source to start fetching new objects from the API
 *
 *  @param completion block to be executed when the fetch is complete
 */
- (void)fetchContactsWithCompletion:(void(^)(void)) completion;

@end
