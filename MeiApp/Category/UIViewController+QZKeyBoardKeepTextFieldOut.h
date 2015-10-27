//
//  UIViewController+QZKeyBoardKeepTextFieldOut.h
//  MeiApp
//  键盘遮挡UITextField的解决办法
//  Created by QianLei on 15/10/24.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (QZKeyBoardKeepTextFieldOut)
-(void)resumeView;
-(void)moveKeyBoard:(CGFloat)Y;
@end
