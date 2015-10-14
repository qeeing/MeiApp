//
//  UserInfo.m
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)shareInstance;
{
    static id _shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[self alloc] initSingleton];
    });
    
    return _shareInstance;
}

- (instancetype)init{
    //断言
    NSAssert(NO, @"单例不可调用init/new");
    return nil;
}

- (instancetype)initSingleton{
    self = [super init];
    if (self) {
        //...
    }
    return self;
}

@end
