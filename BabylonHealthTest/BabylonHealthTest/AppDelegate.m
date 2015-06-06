//
//  AppDelegate.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "AppDelegate.h"
#import "BHApiClient.h"
#import "BHFlowManager.h"

@interface AppDelegate ()

@property (nonatomic, strong, readwrite) BHFlowManager *flowManager;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.flowManager = [BHFlowManager new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.flowManager.rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
