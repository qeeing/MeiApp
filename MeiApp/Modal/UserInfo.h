//
//  UserInfo.h
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, strong) NSString *userId;

+ (instancetype)shareInstance;

@end
