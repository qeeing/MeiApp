//
//  ManagerViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ManagerViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //导航首页不显示navigationBar
//    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //导航次页开始显示navigationBar
//    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

//注销登录，跳转到注册、登录页面
- (IBAction)signupLoginViewController:(id)sender {
    //生成storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Register" bundle:nil];
    //通过Identifier找到storyboard中的某个ViewController
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ADViewControllerId"];
    //加载指定的ViewController
    [self.navigationController pushViewController:vc animated:YES];
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
