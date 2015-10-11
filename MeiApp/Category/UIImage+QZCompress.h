//
//  UIImage+QZCompress.h
//  SuningEIM
//
//  Created by QianLei on 15/9/14.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QZCompress)

//并不会精确压缩到指定大小，最终大小接近指定大小

/**
 *  压缩图片文件大小
 *
 *  @param maxFileSize 希望压缩到多大，以KB为单位
 *
 *  @return 压缩后的图片，jpg格式
 */
- (UIImage *)compressImageToFileSizeKB:(NSUInteger)maxFileSize;

/**
 *  压缩图片文件大小
 *
 *  @param image       原图
 *  @param maxFileSize 希望压缩到多大，以KB为单位
 *
 *  @return 压缩后的图片，jpg格式
 */
+ (UIImage *)compressImage:(UIImage *)image ToFileSizeKB:(NSUInteger)maxFileSize;

/**
 *  压缩图片文件大小
 *
 *  @param imagePath 原图片文件绝对路径
 *  @param maxFileSize  希望压缩到多大，以KB为单位
 *
 *  @return 压缩后的图片，jpg格式
 */
+ (UIImage *)compressImagePath:(NSString *)imagePath toFileSizeKB:(NSUInteger)maxFileSize;

@end
