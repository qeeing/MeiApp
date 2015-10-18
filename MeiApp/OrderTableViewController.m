//
//  OrderTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "OrderTableViewController.h"
#import "CALayer+Additions.h"
#import "OrderTableViewCell.h"

@interface OrderTableViewController ()<OrderCellDelegate>

@end

@implementation OrderTableViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchDataFromServer];
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)refreshControlHandler
//{
//    [self.refreshControl endRefreshing];
//    
//    [self fetchDataFromServer];
//    
//    [self.tableView reloadData];
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
//{
//    if( self.refreshControl.isRefreshing ) {
//        [self refreshControlHandler];
//    }
//}

/*
 "orders":[{"orderid":id,"sumprice":总价,"createtime"：创建时间," serviceid":," servicename":服务名称,"userid":," ordphone":," state": },{}]
 */
- (void)fetchDataFromServer;
{
    self.dataArray = @[
                       @{@"orderid" :@1,
                         @"sumprice":@"总价",
                         @"createtime"  :@"2015年10月14日22:47",
                         @"serviceid"   :@123,
                         @"servicename" :@"服务名称1",
                         @"userid"  :@3121,
                         @"ordphone":@"18551601413",
                         @"state"   :@2 },
                       @{@"orderid" :@2,
                         @"sumprice":@"总价",
                         @"createtime"  :@"2015年10月14日22:47",
                         @"serviceid"   :@123,
                         @"servicename" :@"服务名称1",
                         @"userid"  :@3121,
                         @"ordphone":@"18551601412",
                         @"state"   :@2 }
                       ];
}

#pragma mark - Table view data source & Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCellId" forIndexPath:indexPath];
    cell.delegate = self;
    
    [cell orderCellInfo:self.dataArray[indexPath.row][@"ordphone"]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"关闭订单";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 从数据源中删除
//    [_data removeObjectAtIndex:indexPath.row];
    // 从列表中删除
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - 订单管理操作：关闭、完成
- (void)closeOrderCell:(OrderTableViewCell *)cell;
{
    
}

- (void)completeOrderCell:(OrderTableViewCell *)cell;
{
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
