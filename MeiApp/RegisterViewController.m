//
//  MainViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/10.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //导航首页不显示navigationBar
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //导航次页开始显示navigationBar
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - IBAction

//登录按钮，跳转到Login.storyboard登录界面
- (IBAction)loginAction:(id)sender {
    //生成storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    //通过Identifier找到storyboard中的某个ViewController
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginVCId"];
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
