//
//  RegisterSucceedViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/10.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "RegisterDoneViewController.h"

@interface RegisterDoneViewController ()

@end

@implementation RegisterDoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)registerSucceed:(id)sender {
    //生成storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    //通过Identifier找到storyboard中的某个ViewController
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"loginSucceedVCId"];
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
