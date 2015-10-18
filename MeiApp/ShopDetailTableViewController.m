//
//  ShopDetailTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ShopDetailTableViewController.h"
#import "ShopIntroduceTableViewCell.h"

@interface ShopDetailTableViewController ()

@end

@implementation ShopDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 {
     "ResultMassage": 返回码,
     "shopid":店铺ID,
     "shopname":店铺名称，
     "Shopimages":[{"imgname":名称,"url":存储位置,"dec":描述},{}],
     "city":市," area":区,
     "telephone":电话,
     "address":地址,
     "time":营业时间,
     "dec":店铺描述
 }
 */
- (void)fetchDataFromServer;
{
    self.dataArray = @[@"店铺名称",@"地址",@"电话",@"营业时间",@"店铺描述"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDetailCellId" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.detailTextLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"ShopIcon"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
