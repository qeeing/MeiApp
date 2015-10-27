//
//  ShopEditViewController.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "ShopEditViewController.h"

@interface ShopEditViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic)NSArray *TextViewArray;
@property (nonatomic, weak) UITextField *activeTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *shopAddress;
@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *openTime;
@property (weak, nonatomic) IBOutlet UITextView *shopDetail;
- (IBAction)uploadShopImage:(UIButton *)sender;
- (IBAction)uploadShopEnvironmentImage:(UIButton *)sender;
@end

@implementation ShopEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopDetail.delegate = self;
    self.shopDetail.returnKeyType = UIReturnKeyDefault;
    //将所有TextField放入数组，减少代码量
    self.TextViewArray= [NSArray arrayWithObjects:self.shopName,self.shopAddress,self.telephone,self.openTime, nil];
    
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

    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
}

-(IBAction)nextOnKeyboard:(UITextField *)sender
{
    NSUInteger index = [self.TextViewArray indexOfObject:sender];
    index++;
    if (index < self.TextViewArray.count ) {
        UITextField *field = self.TextViewArray[index];
        [field becomeFirstResponder];
    } else if (index == self.TextViewArray.count - 1) {
        [self hidenKeyboard];
    }
}

-(void)hidenKeyboard
{
    for (UITextField *tf in self.TextViewArray) {
        [tf resignFirstResponder];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTextField = nil;
}

- (void)textViewDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
}

- (void)textViewDidEndEditing:(UITextField *)textField
{
    self.activeTextField = nil;
}
//UITextView没有想UITextField中textFieldShouldReturn:这样的方法，那么要实现UITextView return键隐藏键盘，可以通过判断输入的字符是不是回车符来实现
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

//注册关于键盘出现通知(Notifications)
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self deregisterFromKeyboardNotifications];
    [super viewWillDisappear:animated];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)deregisterFromKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    NSDictionary* info = [notification userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardRect.size.height+10, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect screenRect = self.view.frame;
    screenRect.size.height -= keyboardRect.size.height;
    if (!CGRectContainsPoint(screenRect, self.activeTextField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeTextField.frame animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)uploadShopImage:(UIButton *)sender {
}

- (IBAction)uploadShopEnvironmentImage:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
