//
//  City.m
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.spell = [[dict[@"spell"] substringToIndex:1]uppercaseString];
    }
    return self;
}
+ (instancetype)cityWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
