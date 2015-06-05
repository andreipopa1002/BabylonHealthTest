//
//  BHFlowManager.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHFlowManager.h"
#import "BHContactsViewController.h"

@interface BHFlowManager()

@property (nonatomic, strong, readwrite) UINavigationController *rootViewController;

@end

@implementation BHFlowManager

- (UINavigationController *)rootViewController {
    if (_rootViewController == nil) {
        BHContactsViewController *contactsViewController = [BHContactsViewController new];
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:contactsViewController];
    }
    return _rootViewController;
}

@end
