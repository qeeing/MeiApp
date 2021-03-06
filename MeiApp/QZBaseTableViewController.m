//
//  QZBaseTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/15.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "QZBaseTableViewController.h"

@interface QZBaseTableViewController ()

@end

@implementation QZBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self layoutForTableView];
    
    [self fetchDataFromServer];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)layoutForTableView;
{
    UIColor *refreshColor = RedColorForNavigationBar;
    
    // 下拉刷新
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    // 设置标题
    NSAttributedString *refreshTitle = [[NSAttributedString alloc]
                                        initWithString: @"下拉刷新"
                                        attributes:@{NSForegroundColorAttributeName : refreshColor }];
    refreshControl.attributedTitle = refreshTitle;
    refreshControl.tintColor = refreshColor;
    //给UIRefreshControl加入背景色，即使是clearColor，刷新标识将会随着下拉逐渐从上部出现
    refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl = refreshControl;
    
    //cell 分割线缩进
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //Only left and right insets are honored.
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);//上、左、下、右
    // 设置毛玻璃
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
//    self.tableView.separatorEffect = vibrancyEffect;

    //不显示空白 cell
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
}

- (void)refreshControlHandler
{
    [self.refreshControl endRefreshing];
    
    [self fetchDataFromServer];
    
    [self.tableView reloadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    if( self.refreshControl.isRefreshing ) {
        [self refreshControlHandler];
    }
}

- (void)fetchDataFromServer;
{
    //子类实现
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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

@end
