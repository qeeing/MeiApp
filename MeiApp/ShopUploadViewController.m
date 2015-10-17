//
//  ShopUploadViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ShopUploadViewController.h"
#import "UIView+Shake.h"
@interface ShopUploadViewController ()
@property (weak, nonatomic) IBOutlet UITextField *shopName;

@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
@end

@implementation ShopUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//点击空白处隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


////添加验证
//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if ([identifier isEqualToString:@"shopUploadSegueId"]) {
//        if (IsStrEmpty(self.shopName.text))
//        {
//            [self.shopName shake];
//            self.alertLabel.hidden = NO;
//            self.alertLabel.text = @"店铺名称不能为空！";
//            return NO;
//        }else{
//            self.alertLabel.hidden = YES;
//            return YES;
//        }
//    }else {
//        return YES;
//    }
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
