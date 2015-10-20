//
//  City.h
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface City : UIView
@property (nonatomic, copy) NSString *name;//取城市名称
@property (nonatomic,copy)NSString *spell;
-(instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cityWithDict:(NSDictionary *)dict;
@end
