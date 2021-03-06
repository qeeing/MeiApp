//
//  RegisteringViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/15.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "RegisteringViewController.h"
#import "UIView+Shake.h"
#import "UIViewController+QZKeyBoardKeepTextFieldOut.h"
@interface RegisteringViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *password2TextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
@property(nonatomic,strong)NSArray *TextViewArray;
- (IBAction)nextButtonPressed:(UIButton *)sender;

@end

@implementation RegisteringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self leftViewImageName:@"Email" forTextField:self.userNameTextField];
    [self leftViewImageName:@"Password" forTextField:self.passwordTextField];
    [self leftViewImageName:@"Password2" forTextField:self.password2TextField];
    
    //将所有TextField放入数组，减少代码量
    self.TextViewArray= [NSArray arrayWithObjects:self.userNameTextField,self.passwordTextField,self.password2TextField,nil];
    
    for (NSUInteger i = 0; i<self.TextViewArray.count; i++) {
        UITextField *textField =(UITextField *)self.TextViewArray[i];
        //delegate
        textField.delegate = self;
        //指定编辑时键盘的return键类型
        if (i<self.TextViewArray.count-1) {
            textField.returnKeyType = UIReturnKeyNext;
        }else{
            textField.returnKeyType = UIReturnKeyDefault;
        }
        //注册键盘响应事件方法
        [textField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    
}
//UITextField的协议方法，当开始编辑时监听
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self moveKeyBoard:40.0f];
    return YES;
}

//点击键盘上的Return按钮响应的方法
-(IBAction)nextOnKeyboard:(UITextField *)sender
{
    if (sender == self.userNameTextField) {
        [self.passwordTextField becomeFirstResponder];
    }else if (sender == self.passwordTextField){
        [self.password2TextField becomeFirstResponder];
    }else if (sender == self.password2TextField){
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.password2TextField resignFirstResponder];
    [self resumeView];
    }
}

- (void) leftViewImageName:(NSString *)ImageName forTextField:(UITextField *)TextFieldName{
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:ImageName]];
    leftView.frame = CGRectMake(0.0, 0.0, leftView.image.size.width+10.0, leftView.image.size.height);
    leftView.contentMode = UIViewContentModeCenter;
    TextFieldName.leftView = leftView;
    TextFieldName.leftViewMode = UITextFieldViewModeAlways;
}

//点击空白处隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
      [self.view endEditing:YES];
      [self resumeView];
//    [self.userNameTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//    [self.password2TextField resignFirstResponder];
//    self.alertLabel.hidden = YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.

    }

- (IBAction)nextButtonPressed:(UIButton *)sender {
}
//添加验证
//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if ([identifier isEqualToString:@"registerNextSegueId"]) {
//        if (IsStrEmpty(self.passwordTextField.text)||
//            IsStrEmpty(self.password2TextField.text)||
//            IsStrEmpty(self.userNameTextField.text))
//        {
//            [self.nextButton shake];
//            self.alertLabel.hidden = NO;
//            self.alertLabel.text = @"内容不能为空！";
//            return NO;
//        }else if ([self isUserNameContainsChinese:self.userNameTextField.text]){
//            [self.userNameTextField shake];
//            self.alertLabel.hidden = NO;
//            self.alertLabel.text = @"用户名不能包含汉字";
//            return NO;
//        }else if (![self.passwordTextField.text isEqualToString:self.password2TextField.text]){
//            //        [self.nextButton shake];
//            [self.password2TextField shake];
//            self.alertLabel.hidden = NO;
//            self.alertLabel.text = @"两次密码需要相同";
//            return NO;
//        } else{
//            self.alertLabel.hidden = YES;
//            return YES;
//        }
//    }else {
//        return YES;
//    }
//}

#pragma mark - 正则匹配

/**
 *   正则判断字符串是否包含汉字
 *
 *  @param userName 用户名
 *
 *  @return 包含汉字返回 YES
 */
- (BOOL)isUserNameContainsChinese:(NSString *)userName
{
    //不能输入汉字：^[^\u4e00-\u9fa5]{0,}$  1-10位数字和字母组合：^[A-Za-z0-9]{1,10}+$
    NSString *pattern = @"^[^\u4e00-\u9fa5]{0,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return !isMatch;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
