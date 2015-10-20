//
//  ServiceTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ServiceTableViewController.h"
#import "ServiceTableViewCell.h"
@interface ServiceTableViewController ()<ServiceCellDelegate>

@end

@implementation ServiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)fetchDataFromServer;
{
    //子类实现
    self.dataArray = @[@"",@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source & Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"serverCellId" forIndexPath:indexPath];
    [cell serviceCellInfo:nil];
    cell.delegate = self;
    return cell;
}
#pragma mark - 编辑服务操作
-(void)editServiceCell:(ServiceTableViewCell *)cell;
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
