//
//  PopoverOrderTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "PopoverOrderTableViewController.h"

@interface PopoverOrderTableViewController ()

@end

@implementation PopoverOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 2, 0, 10);
    self.tableView.backgroundColor = PinkColorForApp;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.preferredContentSize = CGSizeMake(100, 143);

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(selectedPopoverIndexPath:)]) {
        [self.delegate selectedPopoverIndexPath:indexPath];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
