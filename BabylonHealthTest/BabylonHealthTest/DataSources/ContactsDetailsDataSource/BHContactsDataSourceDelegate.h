//
//  BHContactsDataSourceDelegate.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHContactsDataSource.h"
@import UIKit;

@interface BHContactsDataSourceDelegate : NSObject <UITableViewDataSource>

- (instancetype)initWithDataSource:(BHContactsDataSource *)dataSource;

@end
