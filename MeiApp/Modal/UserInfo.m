//
//  UserInfo.m
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)sharedInstance;
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initSingleton];
    });
    
    return _sharedInstance;
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
