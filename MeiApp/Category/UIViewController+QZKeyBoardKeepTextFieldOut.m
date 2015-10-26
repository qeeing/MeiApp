//
//  UIViewController+QZKeyBoardKeepTextFieldOut.m
//  MeiApp

//  对于被键盘遮挡的UITextField，0：viewDidLoad中设置相关delegate，1：对textFieldShouldBeginEditing进行上移操作，2：nextOnKeyboard和touchesBegan中都需要发送resumeView消息，进行下移

//  Created by QianLei on 15/10/24.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "UIViewController+QZKeyBoardKeepTextFieldOut.h"

@implementation UIViewController (QZKeyBoardKeepTextFieldOut)
//恢复原始视图位置:当产生上移后必须手动下移
-(void)resumeView
{

    [UIView animateWithDuration:0.30f animations:^{
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        float Y = 0.0f;
        CGRect rect=CGRectMake(0.0f,Y,width,height);
        self.view.frame=rect;
    }];
}

@end
