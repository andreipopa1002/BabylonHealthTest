//
//  BHFlowManager.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
/**
 *  This class will controll the UI flow of the app
 */
@interface BHFlowManager : NSObject
/**
 *  the root view controller of the app
 */
@property (nonatomic, strong, readonly) UINavigationController *rootViewController;

@end
