//
//  LoginViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/10.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+QZKeyBoardKeepTextFieldOut.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation LoginViewController

//UITextField的协议方法，当开始编辑时监听
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //上移120个单位，按实际情况设置
    CGRect rect=CGRectMake(0.0f,-120,width,height);
    self.view.frame=rect;
    [UIView commitAnimations];
    return YES;
}
//恢复原始视图位置:当产生上移后必须手动下移
//-(void)resumeView
//{
//    NSTimeInterval animationDuration=0.30f;
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    float width = self.view.frame.size.width;
//    float height = self.view.frame.size.height;
//    //如果当前View是父视图，则Y为20个像素高度，如果当前View为其他View的子视图，则动态调节Y的高度
//    float Y = 20.0f;
//    CGRect rect=CGRectMake(0.0f,Y,width,height);
//    self.view.frame=rect;
//    [UIView commitAnimations];
//}
//隐藏键盘的方法
-(void)hidenKeyboard
{
    [self.userNameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    //发送UIViewController+QZKeyBoardKeepTextFieldOut中的resumeView消息
    [self resumeView];
}

//点击键盘上的Return按钮响应的方法
-(IBAction)nextOnKeyboard:(UITextField *)sender
{
    if (sender == self.userNameText) {
        [self.passwordText becomeFirstResponder];
    }else if (sender == self.passwordText){
        [self hidenKeyboard];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //指定本身为代理
    self.userNameText.delegate = self;
    self.passwordText.delegate = self;
    //指定编辑时键盘的return键类型
    self.userNameText.returnKeyType = UIReturnKeyNext;
    self.passwordText.returnKeyType = UIReturnKeyDefault;
    
    //注册键盘响应事件方法
    [self.userNameText addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.passwordText addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
//    gesture.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:gesture];
}

//点击空白处隐藏键盘，也可用UITapGestureRecognizer实现
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    //将上移的部分还原
    [self resumeView];
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;
{
    
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
