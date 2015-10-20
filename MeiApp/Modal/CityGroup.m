//
//  CityGroup.m
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "CityGroup.h"
#import "City.h"
@implementation CityGroup

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        //嵌套的字典转模型
        self.title = dict[@"name"];
        self.spell = [[dict[@"spell"] substringToIndex:1]uppercaseString];
        NSArray *dictcitys = dict[@"children"];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *citydic in dictcitys) {
            City *city = [[City alloc]initWithDict:citydic];
            [arrM addObject:city];
        }
        self.citys = arrM;
    }
        return self;
    }

+ (instancetype)cityGroupWithdict:(NSDictionary *)dict
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
