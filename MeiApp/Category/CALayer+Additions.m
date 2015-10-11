//
//  CALayer+Additions.m
//  xibRuntimeDemo
//
//  Created by QianLei on 15/8/27.
//  Copyright (c) 2015年 QianLei-Mac. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color;
{
    self.borderColor = color.CGColor;
}

@end
