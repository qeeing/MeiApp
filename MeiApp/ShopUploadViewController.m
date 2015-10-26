//
//  ShopUploadViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ShopUploadViewController.h"
#import "UIView+Shake.h"
#import "UIViewController+QZKeyBoardKeepTextFieldOut.h"
@interface ShopUploadViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *shopAddress;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
- (IBAction)cityPickerButtonPressed:(id)sender;

@end

@implementation ShopUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shopName.delegate = self;
    self.shopAddress.delegate = self;
    [self.shopName addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.shopAddress addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
}
//UITextField的协议方法，当开始编辑时监听
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //上移120个单位，按实际情况设置
    CGRect rect=CGRectMake(0.0f,-40,width,height);
    self.view.frame=rect;
    [UIView commitAnimations];
    return YES;
}

//点击键盘上的Return按钮响应的方法
-(IBAction)nextOnKeyboard:(UITextField *)sender
{
    [self.shopName resignFirstResponder];
    [self.shopAddress resignFirstResponder];
    [self resumeView];
}

//点击空白处隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self resumeView];
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

- (IBAction)cityPickerButtonPressed:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
