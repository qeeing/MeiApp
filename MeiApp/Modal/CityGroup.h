//
//  CityGroup.h
//  MeiApp
//
//  Created by QianLei on 15/10/20.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import <UIKit/UIKit.h>
//按省份分组
@interface CityGroup : UIView
@property (nonatomic,copy)NSString *title;//取城市省份，如安徽，City.plist中"name"
@property (nonatomic,copy)NSString *spell;
@property (nonatomic,strong)NSArray *citys;//该省份下的城市，City.plist中"children"
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cityGroupWithdict:(NSDictionary *)dict;
@end
