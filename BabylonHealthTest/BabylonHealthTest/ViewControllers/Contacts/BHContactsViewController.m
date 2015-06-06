//
//  BHContactsViewController.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHContactsViewController.h"
#import "BHContactsDataSource.h"

@interface BHContactsViewController ()

@property (nonatomic, strong, readwrite) IBOutlet UITableView *tableView;

@property (nonatomic, strong, readwrite) BHContactsDataSource *dataSource;

@end

@implementation BHContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

#pragma mark - Internal methods
- (void)setupTableView {
    self.dataSource = [BHContactsDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self showLoadingIndicator];
    typeof(self) __weak weakSelf = self;
    [self.dataSource fetchContactsWithCompletion:^{
        [weakSelf hideLoadingIndicator];
        [weakSelf.tableView reloadData];
    }];
}

@end
