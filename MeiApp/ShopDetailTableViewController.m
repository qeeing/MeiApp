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
    self.dataArray = @[@"店铺名称",@"地址",@"电话",@"营业时间",@"店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.dataArray.count - 1) {
        return 44;
    } else {
//        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"shopIntroduceCellId"];
//        cell.detailTextLabel.numberOfLines = 0;
//        
//        cell.detailTextLabel.text = self.dataArray[indexPath.row];
//
//        CGFloat height = [self heightForLabel:cell.detailTextLabel withText:cell.detailTextLabel.text];
//        
//        return height;
        return 100;
    }
}

//-(CGFloat)heightForLabel:(UILabel *)label withText:(NSString *)text{
//    
//    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:label.font}];
//    CGRect rect = [attributedText boundingRectWithSize:(CGSize){label.frame.size.width, CGFLOAT_MAX}
//                                               options:NSStringDrawingUsesLineFragmentOrigin
//                                               context:nil];
//    
//    return ceil(rect.size.height);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.detailTextLabel.text = self.dataArray[indexPath.row];
    
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
