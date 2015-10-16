//
//  PublicDef.h
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#ifndef MeiApp_PublicDef_h
#define MeiApp_PublicDef_h

//iOS 版本号
#define CURRENT_SYS_VERSION [[UIDevice currentDevice].systemVersion floatValue]
//屏幕宽度、高度
#define IOS_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define IOS_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
#define IsStrEmptyForDB(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""])||([(_ref)isEqualToString:@"(null)"]))

#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

#pragma mark - Block相关
///block 声明
typedef void (^QZBasicBlock)(void);
typedef void (^QZOperationCallBackBlock)(BOOL isSuccess, NSString *errorMsg);
typedef void (^QZCallBackBlockWithResult)(BOOL isSuccess, NSString *errorMsg, id result);
typedef void (^QZArrayBlock)(NSArray *array);
typedef void (^DoBlock)(id data);



#endif
