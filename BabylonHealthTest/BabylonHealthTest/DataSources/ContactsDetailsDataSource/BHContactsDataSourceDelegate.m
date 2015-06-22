//
//  BHContactsDataSourceDelegate.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 22/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHContactsDataSourceDelegate.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface BHContactsDataSourceDelegate ()

@property (nonatomic, weak) BHContactsDataSource *dataSource;

@end

@implementation BHContactsDataSourceDelegate

#pragma mark - External methods
- (instancetype)initWithDataSource:(BHContactsDataSource *)dataSource {
    self = [super init];
    if (self) {
        _dataSource = dataSource;
    }
    return self;
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return [self configureCell:cell withContact:self.dataSource.contacts[indexPath.row]];
}

#pragma mark - Internal Methods
- (UITableViewCell *)configureCell:(UITableViewCell *)cell withContact:(BHContact *)contact {
    cell.textLabel.text = contact.firstName;
    cell.detailTextLabel.text = contact.lastName;
    [cell.imageView setImageWithURL:[NSURL URLWithString:contact.avatarURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    return cell;
}

@end
