//
//  BHContactsDataSource.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 06/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHContactsDataSource.h"
#import "BHApiClient.h"
#import "BHCoreDataManager.h"

@interface BHContactsDataSource()

@property (nonatomic, strong, readwrite) NSArray *contacts;

@end

@implementation BHContactsDataSource

#pragma mark - External Methods
- (void)fetchContactsWithCompletion:(void(^)(void)) completion {
    typeof(self) __weak weakSelf = self;
    [[BHApiClient sharedClient] retrieveContactListWithCompletion:^(NSArray *contacts) {
        weakSelf.contacts = [BHCoreDataManager updateContactsWithContacts:contacts];
        completion();
    }];
}

@end
