//
//  QZBaseViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/15.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "QZBaseViewController.h"

@interface QZBaseViewController ()

@end

@implementation QZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //按钮颜色
    self.navigationController.navigationBar.tintColor = AppColor;
    //标题颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : AppColor };
    //整个颜色
    //    self.navigationController.navigationBar.barTintColor = AppColor;
    
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
