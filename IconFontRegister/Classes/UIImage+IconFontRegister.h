//
//  UIImage+IconFontRegister.h
//  IconFontRegister
//
//  Created by sungrow on 2019/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (IconFontRegister)

/**
 通过 unicode 生成 image

 @param unicode 字符
 @param fontName 字体名称 (字体需注册后,才能使用)
 @param bgColor 背景颜色
 @param iconColor 字体颜色
 @param size 生成的图片尺寸
 @param insets 生成的图片内边距
 @param imageOrientation 生成的图片方向
 @return 生成的图片
 */
+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                  backgroundColor:(UIColor *)bgColor
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets
                 imageOrientation:(UIImageOrientation)imageOrientation;

/**
 通过 unicode 生成 image

 @param unicode 字符
 @param fontName 字体名称 (字体需注册后,才能使用)
 @param gradientColors 渐变背景颜色
 @param gradientLocations 渐变背景颜色位置(应和颜色对应,数组中临近两个值表示颜色渐变的开始和结束,取值为(0.0 ~ 1.0))
 @param gradientStartPoint 渐变的起始点
 @param gradientEndPoint 渐变的结束点
 @param iconColor 字体颜色
 @param size 生成的图片尺寸
 @param insets 生成的图片内边距
 @param imageOrientation 生成的图片方向
 @return 生成的图片
 */
+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                   gradientColors:(NSArray <UIColor *>*)gradientColors
                gradientLocations:(NSArray <NSNumber *>*)gradientLocations
               gradientStartPoint:(CGPoint)gradientStartPoint
                 gradientEndPoint:(CGPoint)gradientEndPoint
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets
                 imageOrientation:(UIImageOrientation)imageOrientation;

/**
 通过 unicode 生成 image

 @param unicode 字符
 @param fontName 字体名称 (字体需注册后,才能使用)
 @param gradientColors 渐变背景颜色
 @param gradientLocations 渐变背景颜色位置(应和颜色对应,数组中临近两个值表示颜色渐变的开始和结束,取值为(0.0 ~ 1.0))
 @param gradientStartPoint 渐变的起始点
 @param gradientEndPoint 渐变的结束点
 @param iconColor 字体颜色
 @param size 生成的图片尺寸
 @param insets 生成的图片内边距
 @param imageOrientation 生成的图片方向
 @param strokeColor 描边颜色
 @param strokeWidth 描边宽度: 负值 加粗; 正值 镂空
 @return 生成的图片
 */
+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                   gradientColors:(NSArray <UIColor *>*)gradientColors
                gradientLocations:(NSArray <NSNumber *>*)gradientLocations
               gradientStartPoint:(CGPoint)gradientStartPoint
                 gradientEndPoint:(CGPoint)gradientEndPoint
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets
                 imageOrientation:(UIImageOrientation)imageOrientation
                      strokeColor:(UIColor *)strokeColor
                      strokeWidth:(CGFloat)strokeWidth;

@end

NS_ASSUME_NONNULL_END
