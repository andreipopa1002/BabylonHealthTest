//
//  BHContactsViewController.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHBaseViewController.h"
@class BHContact;

@protocol BHContactsViewControllerDelegate <NSObject>

- (void)usedDidSelectContact:(BHContact *)contact;

@end
/**
 *  This ViewController will display a list of contacts
 */
@interface BHContactsViewController : BHBaseViewController

@property (nonatomic, weak, readwrite) id<BHContactsViewControllerDelegate> delegate;

@end