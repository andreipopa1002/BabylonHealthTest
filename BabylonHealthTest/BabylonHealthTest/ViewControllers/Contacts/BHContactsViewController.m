//
//  BHContactsViewController.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHContactsViewController.h"
#import "BHContactsDataSource.h"

@interface BHContactsViewController ()<UITableViewDelegate>

@property (nonatomic, strong, readwrite) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) BHContactsDataSource *dataSource;

@end

@implementation BHContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.title = NSLocalizedString(@"Contacts", nil);
}

#pragma mark - Internal methods
- (void)setupTableView {
    self.dataSource = [BHContactsDataSource new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self showLoadingIndicator];
    typeof(self) __weak weakSelf = self;
    [self.dataSource fetchContactsWithCompletion:^{
        [weakSelf hideLoadingIndicator];
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegateMethods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(usedDidSelectContact:)]) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [self.delegate usedDidSelectContact:self.dataSource.contacts[indexPath.row]];
    }
}

@end
