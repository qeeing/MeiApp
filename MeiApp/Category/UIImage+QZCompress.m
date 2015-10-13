//
//  UIImage+QZCompress.m
//  MeiApp
//
//  Created by QianLei on 15/9/14.
//  Copyright (c) 2015年 channe. All rights reserved.
//

#import "UIImage+QZCompress.h"

#define COMPRESSION 1.0f
//static CGFloat const compression = 0.9f;
static CGFloat const maxCompression = 0.3f;

@implementation UIImage (QZCompress)

- (UIImage *)compressImageToFileSizeKB:(NSUInteger)maxFileSize;
{
    CGFloat compression = COMPRESSION;

    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    NSUInteger imageFileSize = imageData.length / 1024; //KB
    if (imageFileSize <= maxFileSize) {
        return self;
    }
    
    //图片太大就继续压缩
    while (imageFileSize > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        //降低内存峰值
        @autoreleasepool {
            imageData = UIImageJPEGRepresentation(self, compression);
            imageFileSize = imageData.length / 1024;
        }
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

+ (UIImage *)compressImage:(UIImage *)image ToFileSizeKB:(NSUInteger)maxFileSize;
{
    CGFloat compression = COMPRESSION;
    
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    NSUInteger imageFileSize = imageData.length / 1024; //KB
    if (imageFileSize <= maxFileSize) {
        return [UIImage imageWithData:imageData];
    }
    
    //图片太大就继续压缩
    while (imageFileSize > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        //降低内存峰值
        @autoreleasepool {
            imageData = UIImageJPEGRepresentation(image, compression);
            imageFileSize = imageData.length / 1024;
        }
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

+ (UIImage *)compressImagePath:(NSString *)imagePath toFileSizeKB:(NSUInteger)maxFileSize;
{
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    NSUInteger imageFileSize = imageData.length / 1024; //KB
    if (imageFileSize <= maxFileSize) {
        return [UIImage imageWithContentsOfFile:imagePath];
    }
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    UIImage *compressedImage = [UIImage compressImage:image ToFileSizeKB:maxFileSize];
    
    return compressedImage;
}

@end
