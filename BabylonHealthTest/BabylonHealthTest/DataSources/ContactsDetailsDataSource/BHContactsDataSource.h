//
//  BHContactsDataSource.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 06/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BHContactsDataSource : NSObject <UITableViewDataSource>

- (void)fetchContactsWithCompletion:(void(^)(void)) completion;

@end
