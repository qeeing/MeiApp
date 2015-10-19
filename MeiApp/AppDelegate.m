//
//  AppDelegate.m
//  MeiApp
//
//  Created by QianLei on 15/10/6.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "AppDelegate.h"

#import "RegisterViewController.h"
#import "ManagerViewController.h"
#import "UIButton+QZAppearance.h"
#import "LoginViewController.h"
#import "QZNormalLabel.h"
#import "QZStateLabel.h"
#import "QZSubStateLabel.h"
#import "QZClearButton.h"
#import "ServiceTableViewCell.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self AppAppearance];
    
    return YES;
}

- (void)AppAppearance
{
    //View 背景色
    [QZBaseView appearance].backgroundColor = GrayColorForBackgroud;
    [QZBaseTableView appearance].backgroundColor = GrayColorForBackgroud;
    
    //导航栏
    [UINavigationBar appearance].tintColor = RedColorForNavigationBar;
    
    //按钮
    [UIButton appearance].backgroundColor = PinkColorForApp;
    [QZClearButton appearance].backgroundColor = [UIColor clearColor];
    //TODO:按钮按下
//    [[UIButton appearance] setBackgroundImage:nil forState:UIControlStateSelected];
    [UIButton appearanceWhenContainedIn:[RegisterViewController class], nil].backgroundColor = [UIColor whiteColor];
    [UIButton appearanceWhenContainedIn:[ManagerViewController class], nil].backgroundColor = [UIColor whiteColor];
    [UIButton appearanceWhenContainedIn:[ServiceTableViewCell class], nil].backgroundColor = [UIColor whiteColor];
    [UIButton appearanceWhenContainedIn:[ServiceTableViewCell class], nil].tintColor = BlackColorForLabel;
    //按钮圆角
    [UIButton appearance].cornerRadius = 4;
    
    //TextField
    [UILabel appearanceWhenContainedIn:[UITextField class], nil].textColor = GrayColorForFont;
    [UITextField appearanceWhenContainedIn:[LoginViewController class], nil].backgroundColor = GrayColorForBackgroud;
    
    //Label
    [QZNormalLabel appearance].textColor = BlackColorForLabel;
    [QZStateLabel appearance].textColor = YellowColorForLabel;
    [QZSubStateLabel appearance].textColor = GrayColorForFont;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
