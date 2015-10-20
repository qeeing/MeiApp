//
//  CityPickerTableViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "CityPickerTableViewController.h"
#import "UIConstant.h"
#import "CityGroup.h"
#import "City.h"

#define citygID @"cityGroupCell"
@interface CityPickerTableViewController ()<UITableViewDataSource>
@property(nonatomic,copy)NSArray *cityGroups;
@end

@implementation CityPickerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
//    self.tableView.rowHeight = 60.f;
    self.tableView.sectionIndexColor = PinkColorForApp;
    self.tableView.sectionIndexBackgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:citygID];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark -实现懒加载 重写cithGroup的get方法
-(NSArray *)cityGroups{
    if (nil == _cityGroups) {
                // 加载City.plist文件
                NSString *path = [[NSBundle mainBundle] pathForResource:@"City" ofType:@"plist"];
                NSArray *cityGroupsdictArray = [NSArray arrayWithContentsOfFile:path];
    
                // 创建模型数组
                NSMutableArray *cityGroupsM = [NSMutableArray array];
                 // 字典转模型 将模型装入数组_cargroups中
                 for (NSDictionary *citydict in cityGroupsdictArray) {
                        CityGroup *cityg = [CityGroup cityGroupWithdict:citydict];
                         [cityGroupsM addObject:cityg];
                     }
                _cityGroups = cityGroupsM;
            }
        return _cityGroups;
}


// 总共多少组
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView
{
    return self.cityGroups.count;
}

// 每组多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cityGroups[section] citys].count;
}

// 加载每一行的cell（cell要显示的内容）
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    // 1、从缓存池获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:citygID];
//    cell.backgroundColor = [UIColor yellowColor];
    // 2、如果没找到就创建一个新的cell
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:citygID];
        }
    
    CityGroup *cityGroups = self.cityGroups[indexPath.section];
    City *city = cityGroups.citys[indexPath.row];
    
    // 3、给cell赋值
    cell.textLabel.text = city.name;
    return cell;
}

// 设置头部内容
- (NSString *)tableView:(nonnull UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CityGroup *cityGroups = self.cityGroups[section];
    return cityGroups.title;
}

// 设置索引条
- (nullable NSArray *)sectionIndexTitlesForTableView:(nonnull UITableView *)tableView
{
    //KVC
//    NSArray *indexArray = [[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"Y",@"Z", nil];
//    indexArray =[self.cityGroups valueForKeyPath:@"spell"];
    return [self.cityGroups valueForKeyPath:@"spell"];//索引
}

//隐藏标题栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

@end
