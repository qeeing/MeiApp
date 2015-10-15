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
    if (IsStrEmpty(self.userNameTextField.text)||IsStrEmpty(self.passwordTextField.text)||IsStrEmpty(self.password2TextField.text)||![self.passwordTextField.text isEqualToString:self.password2TextField.text]) {
        self.nextButton.enabled=false;
        self.nextButton.backgroundColor=[UIColor grayColor];
        
    }
    else{
        
    }
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
//        if (IsStrEmpty(self.userNameTextField.text)||IsStrEmpty(self.passwordTextField.text)||IsStrEmpty(self.password2TextField.text)||![self.passwordTextField.text isEqualToString:self.password2TextField.text]) {
//            self.nextButton.enabled=false;
//            self.nextButton.backgroundColor=[UIColor grayColor];
////            registerNextSegueId
//            [self shouldPerformSegueWithIdentifier:@"" sender:self];
//        }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"registerNextSegueId"]) {
        if (IsStrEmpty(self.userNameTextField.text)||
            IsStrEmpty(self.passwordTextField.text)||
            IsStrEmpty(self.password2TextField.text)||
            ![self.passwordTextField.text isEqualToString:self.password2TextField.text])
        {
            [self.nextButton shake];
            self.alertLabel.hidden = NO;
            return NO;
        } else {
            self.alertLabel.hidden = YES;
            return YES;
        }
    } else {
        return YES;
    }

}

@end
