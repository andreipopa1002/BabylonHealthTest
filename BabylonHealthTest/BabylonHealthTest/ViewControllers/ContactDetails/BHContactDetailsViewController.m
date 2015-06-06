//
//  BHContactDetailsViewController.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHContactDetailsViewController.h"
#import "BHContact.h"
#import "BHContactDetails.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

static CGFloat const kNameRow = 0;
static CGFloat const kAddressRow = 1;
static CGFloat const kPhoneNumberRow = 2;
static CGFloat const kEmailRow = 3;
static CGFloat const kCreatedAtRow = 4;
static CGFloat const kUpdatedAtRow = 5;

static CGFloat const kNumberOfRows = 6;

@interface BHContactDetailsViewController ()<UITableViewDataSource>

@property (nonatomic, weak, readwrite) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) BHContact *contact;
@property (nonatomic, strong, readwrite) NSDateFormatter *formatter;

@end

@implementation BHContactDetailsViewController

- (instancetype)initWithContact:(BHContact *)contact {
    self = [super init];
    if (self) {
        _contact = contact;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Contact Details", nil);
    [self setupTableView];
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"DetailsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [self customizeCell:cell atIndexPath:indexPath];
    
    return cell;
}

# pragma mark - Internal Methods
- (void)customizeCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == kNameRow) {
        [cell.imageView setImageWithURL:[NSURL URLWithString:self.contact.avatarURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cell.textLabel.text = self.contact.firstName;
        cell.detailTextLabel.text = self.contact.lastName;
    } else if (indexPath.row == kAddressRow) {
        cell.textLabel.text = NSLocalizedString(@"Address", nil);
        cell.detailTextLabel.text = self.contact.contactDetails.address;
    } else if (indexPath.row == kPhoneNumberRow) {
        cell.textLabel.text = NSLocalizedString(@"Phone Number", nil);
        cell.detailTextLabel.text = self.contact.contactDetails.phoneNumber;
    } else if (indexPath.row == kEmailRow) {
        cell.textLabel.text = NSLocalizedString(@"Email", nil);
        cell.detailTextLabel.text = self.contact.contactDetails.email;
    } else if (indexPath.row == kCreatedAtRow) {
        cell.textLabel.text = NSLocalizedString(@"Created at", nil);
        cell.detailTextLabel.text = [self.formatter stringFromDate:self.contact.contactDetails.createdAt];
    } else if (indexPath.row == kUpdatedAtRow) {
        cell.textLabel.text = NSLocalizedString(@"Updated at", nil);
        cell.detailTextLabel.text = [self.formatter stringFromDate:self.contact.contactDetails.updatedAt];
    }
}

- (NSDateFormatter *)formatter {
    if (_formatter == nil) {
        _formatter = [NSDateFormatter new];
        _formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _formatter.dateFormat = @"yy/MM/dd HH:mm:ss";
    }
    return _formatter;
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.bounces = NO;
}

@end
