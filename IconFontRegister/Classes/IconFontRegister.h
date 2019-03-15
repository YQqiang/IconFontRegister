//
//  IconFontRegister.h
//  IconFontRegister
//
//  Created by sungrow on 2019/3/15.
//

#ifndef IconFontRegister_h
#define IconFontRegister_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "UIImage+IconFontRegister.h"

/**
 根据文件路径注册字体
 
 @param url 路径
 */
static inline void RegisterFontURL(NSURL *url) {
    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]]) {
        NSLog(@"Font file doesn't exist");
        return;
    }
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

/**
 根据文件及bundle拼接路径注册字体
 
 @param name 字体文件名称
 @param extension 字体文件扩展名
 @param bundle 包名
 */
static inline void RegisterFontFullPath(NSString *name, NSString *extension, NSBundle *bundle) {
    if ([[UIFont familyNames] containsObject:name]) {
        return;
    }
    NSURL *fontFileUrl = [bundle URLForResource:name withExtension:extension];
    RegisterFontURL(fontFileUrl);
}

/**
 根据文件名注册字体 默认加载 mainBundle
 
 @param name 文件名称
 @param extension 文件扩展名
 */
static inline void RegisterFontWithNameExtension(NSString *name, NSString *extension) {
    RegisterFontFullPath(name, extension, [NSBundle mainBundle]);
}

/**
 根据文件注册字体 默认为 mainBundle, 扩展名为 ttf
 
 @param name 文件名称
 */
static inline void RegisterFontWithOnlyName(NSString *name) {
    RegisterFontWithNameExtension(name, @"ttf");
}

#endif /* IconFontRegister_h */
