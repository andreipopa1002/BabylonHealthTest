//
//  BHFlowManager.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHFlowManager.h"
#import "BHContactsViewController.h"
#import "BHContactDetailsViewController.h"

@interface BHFlowManager()<BHContactsViewControllerDelegate>

@property (nonatomic, strong, readwrite) UINavigationController *rootViewController;

@end

@implementation BHFlowManager

- (UINavigationController *)rootViewController {
    if (_rootViewController == nil) {
        BHContactsViewController *contactsViewController = [BHContactsViewController new];
        contactsViewController.delegate = self;
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:contactsViewController];
    }
    return _rootViewController;
}

#pragma mark - BHContactsViewControllerDelegate methods
- (void)usedDidSelectContact:(BHContact *)contact {
    BHContactDetailsViewController *contactDetailsViewController = [[BHContactDetailsViewController alloc] initWithContact:contact];
    [self.rootViewController pushViewController:contactDetailsViewController animated:YES];
}

@end
