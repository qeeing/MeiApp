//
//  UIButton+QZAppearance.m
//  MeiApp
//
//  Created by QianLei on 15/10/17.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "UIButton+QZAppearance.h"

@implementation UIButton (QZAppearance)

@dynamic cornerRadius;

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

@end
