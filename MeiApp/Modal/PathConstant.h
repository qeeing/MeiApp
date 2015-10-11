//
//  PathConstant.h
//  MeiApp
//
//  Created by QianLei on 15/10/11.
//  Copyright (c) 2015年 QianLei. All rights reserved.
//

#ifndef MeiApp_PathConstant_h
#define MeiApp_PathConstant_h

#import "UserInfo.h"

static inline void CreateDirectory(NSString *path)
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = YES;
    BOOL isExist = [fileManager fileExistsAtPath:path
                                     isDirectory:&isDir];
    if (!isExist)
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
}

//公共图像、语音、视频文件目录
static inline NSString *PublicMediaPath()
{
    NSString *mediaPath = [NSSearchPathForDirectoriesInDomains
                           (NSLibraryDirectory, NSUserDomainMask, YES)
                           objectAtIndex:0];
    mediaPath = [mediaPath stringByAppendingPathComponent:@"cache/public/media"];
    CreateDirectory(mediaPath);
    return mediaPath;
}

//公共偏好设置、数据库等目录
static inline NSString *PublicPreferencesPath()
{
    NSString *mediaPath = [NSSearchPathForDirectoriesInDomains
                           (NSLibraryDirectory, NSUserDomainMask, YES)
                           objectAtIndex:0];
    mediaPath = [mediaPath stringByAppendingPathComponent:@"cache/public/preferences"];
    CreateDirectory(mediaPath);
    return mediaPath;
}

//用户偏好设置、数据库等目录
static inline NSString *UserPreferencesPath()
{
    NSString *jid = [UserInfo shareInstance].userId;
    if (IsStrEmpty(userId)) {
        return @"";
    }
    
    NSString *mediaPath = [NSSearchPathForDirectoriesInDomains
                           (NSLibraryDirectory, NSUserDomainMask, YES)
                           objectAtIndex:0];
    mediaPath = [mediaPath stringByAppendingPathComponent:@"cache"];
    mediaPath = [mediaPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/preferences", jid]];
    CreateDirectory(mediaPath);
    return mediaPath;
}

#endif
