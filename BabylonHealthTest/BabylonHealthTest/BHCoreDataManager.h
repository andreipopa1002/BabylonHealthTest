//
//  BHCoreDataManager.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHCoreDataManager : NSObject

+ (instancetype)sharedManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
