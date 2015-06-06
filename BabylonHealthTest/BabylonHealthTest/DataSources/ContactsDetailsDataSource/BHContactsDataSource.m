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
#import "BHContact.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface BHContactsDataSource()

@property (nonatomic, strong, readwrite) NSArray *contacts;

@end

@implementation BHContactsDataSource

#pragma mark - External Methods
- (void)fetchContactsWithCompletion:(void(^)(void)) completion {
    typeof(self) __weak weakSelf = self;
    [[BHApiClient sharedClient] retrieveContactListWithCompletion:^(NSArray *contacts) {
        weakSelf.contacts = [BHContact updateContactsWithContacts:contacts];
        completion();
    }];
}

#pragma mark - Internal Methods


#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    BHContact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.firstName;
    cell.detailTextLabel.text = contact.lastName;
    [cell.imageView setImageWithURL:[NSURL URLWithString:contact.avatarURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    return cell;
}

@end
