//
//  Common.m
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#import "Common.h"
#import <ImageIO/ImageIO.h>

@implementation Common

+ (unsigned long long)fileSizeOfPath:(NSString *)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath])
    {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

////简单判断图片文件格式
//+ (NSString *)imageFileTypeOfImage:(UIImage *)image;
//{
//    if (!image) {
//        return nil;
//    }
//    CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
//    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
//    if (data.length <= 0) {
//        return nil;
//    }
//    
//    uint8_t c;
//    [data getBytes:&c length:1];
//    
//    switch (c) {
//        case 0xFF:
//            return @"jpg";
//        case 0x89:
//            return @"png";
//        case 0x47:
//            return @"gif";
//        case 0x42:
//            return @"bmp";
//        case 0x49:
//        case 0x4D:
//            return @"tiff";
//    }
//    //默认值png
//    return @"png";
//}

@end
