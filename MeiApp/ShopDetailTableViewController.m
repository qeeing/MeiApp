//
//  ShopDetailTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ShopDetailTableViewController.h"
#import "UIImageView+WebCache.h"
#import "ShopDetailImageCollectionCell.h"

@interface ShopDetailTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *tableHeaderImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *tableFooterCollectionView;

@end

@implementation ShopDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsZero;
    
    self.tableView.tableFooterView = self.tableFooterCollectionView;
    self.tableFooterCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self fetchImageFilesFromServer];
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
    self.dataArray = @[@"店铺名称",@"地址",@"电话",@"营业时间",@"店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述店铺描述",
                       @[@"http://i.stack.imgur.com/T2Rv0.png",@"http://i.stack.imgur.com/FQYYU.png"]];
}

- (void)fetchImageFilesFromServer;
{
//    NSArray *imageUrls = self.dataArray.lastObject;

//    [self.tableHeaderImageView sd_setImageWithURL:[NSURL URLWithString:imageUrls[1]]];
    
}

CGFloat _cellLabelHeight;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSString *cellName = cell.textLabel.text;
    if ([cellName isEqualToString:@"详细介绍"])
    {
        cell.detailTextLabel.text = self.dataArray[indexPath.row];
        
        CGFloat stringWidth = cell.detailTextLabel.attributedText.size.width + 5;
        CGFloat labelWidth = [UIScreen mainScreen].bounds.size.width - 20;
        
        NSUInteger lineNums = 1;
        if (stringWidth > labelWidth) {
            lineNums = stringWidth / labelWidth + 1;
        }
        if (!_cellLabelHeight) {
            _cellLabelHeight = cell.detailTextLabel.frame.size.height;
        }
        CGFloat height = _cellLabelHeight * lineNums + cell.textLabel.frame.size.height + 20;
        
        return height > 44 ? height : 44;
    } else {
        return 44;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.detailTextLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionView DataSource

// section的数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopDetailImageCollectionCell *cell = (ShopDetailImageCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"shopDetailImageCellId" forIndexPath:indexPath];
    
//    NSArray *imageUrls = self.dataArray.lastObject;
    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrls[0]]];
    cell.imageView.image = [UIImage imageNamed:@"ShopImage"];
    
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
