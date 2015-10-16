//
//  RegisteringViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/15.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "RegisteringViewController.h"
#import "UIView+Shake.h"

@interface RegisteringViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *password2TextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
- (IBAction)nextButtonPressed:(UIButton *)sender;

@end

@implementation RegisteringViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.

    }

- (IBAction)nextButtonPressed:(UIButton *)sender {
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
//    if ([identifier isEqualToString:@"registerNextSegueId"]) {
//        if (IsStrEmpty(self.userNameTextField.text)||
//            IsStrEmpty(self.passwordTextField.text)||
//            IsStrEmpty(self.password2TextField.text)||
//            ![self.passwordTextField.text isEqualToString:self.password2TextField.text])
//        {
//            [self.nextButton shake];
//            self.alertLabel.hidden = NO;
//            self.alertLabel.text = @"内容不能为空且两次密码需要相同！";
//            return NO;
//        } else {
//            self.alertLabel.hidden = YES;
//            return YES;
//        }
//    } else {
//        return YES;
//    }
    
    if (IsStrEmpty(self.passwordTextField.text)||
        IsStrEmpty(self.password2TextField.text)||
        IsStrEmpty(self.userNameTextField.text)){
        [self.nextButton shake];
        self.alertLabel.hidden = NO;
        self.alertLabel.text = @"内容不能为空！";
        return NO;
    }else if (![self checkUserName:self.userNameTextField.text]){
        [self.userNameTextField shake];
        self.alertLabel.hidden = NO;
        self.alertLabel.text = @"用户名不能包含汉字";
        return NO;
    }else if (![self.passwordTextField.text isEqualToString:self.password2TextField.text]){
//        [self.nextButton shake];
        [self.password2TextField shake];
        self.alertLabel.hidden = NO;
        self.alertLabel.text = @"两次密码需要相同";
        return NO;
    }
    
    else{
        self.alertLabel.hidden = YES;
        return YES;
    }
}

#pragma mark - 正则匹配

- (BOOL)checkUserName:(NSString *)userName
{//不能输入汉字：^[^\u4e00-\u9fa5]{0,}$  1-10位数字和字母组合：^[A-Za-z0-9]{1,10}+$
    NSString *pattern = @"^[^\u4e00-\u9fa5]{0,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}

@end
