//
//  BHContactDetailsViewController.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHBaseViewController.h"
@class BHContact;
/**
 This ViewController will display a the details for a specific contact
 */
@interface BHContactDetailsViewController : BHBaseViewController
/**
 *  Initializes the ViewController with the appropriate contact
 *
 *  @param contact BHContact object
 *
 *  @return BHContactDetailsViewController instance
 */
- (instancetype)initWithContact:(BHContact *)contact;

@end
