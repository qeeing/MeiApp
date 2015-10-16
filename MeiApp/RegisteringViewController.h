//
//  RegisteringViewController.h
//  MeiApp
//
//  Created by QianLei on 15/10/15.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteringViewController : UIViewController

#pragma 正则匹配用户名不能包含汉字
- (BOOL)checkUserName:(NSString *) userName;
@end
