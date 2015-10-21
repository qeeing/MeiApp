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
#import "WYPopoverController.h"
#import "PopoverOrderTableViewController.h"
#import "WYStoryboardPopoverSegue.h"
#import "QZClearButton.h"

@interface OrderTableViewController ()<OrderCellDelegate,WYPopoverControllerDelegate,QZPopoverDelegate>
{
    WYPopoverController *popoverController;
}

@end

@implementation OrderTableViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRightBarButton];
}

- (void)setRightBarButton
{
    QZClearButton *rightButton = [[QZClearButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [rightButton setTitle:@"筛选" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [rightButton setTitleColor:RedColorForNavigationBar forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    rightButton.frame = CGRectMake(0, 0, 40, 24);
    [rightButton addTarget:self action:@selector(selectedButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

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



//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectedButtonPressed:(UIButton *)sender {
    //生成storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    //通过Identifier找到storyboard中的某个ViewController
    PopoverOrderTableViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"QZPopoverVCId"];
    controller.preferredContentSize = CGSizeMake(100, 143);
    controller.delegate = self;
    
    popoverController = [[WYPopoverController alloc] initWithContentViewController:controller];
    //popover 主题样式在 AppDelegate 中设置
    popoverController.delegate = self;
    
    [popoverController presentPopoverFromRect:sender.bounds
                                       inView:sender
                     permittedArrowDirections:WYPopoverArrowDirectionUp
                                     animated:YES
                                      options:WYPopoverAnimationOptionFadeWithScale];
}

- (void)selectedPopoverIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"indexPath:%@",indexPath);
    //TODO:根据条件刷选订单
    
    [popoverController dismissPopoverAnimated:YES completion:^{
        [self popoverControllerDidDismissPopover:popoverController];
    }];
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    popoverController.delegate = nil;
    popoverController = nil;
}

@end
