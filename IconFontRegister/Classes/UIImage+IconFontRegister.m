//
//  UIImage+IconFontRegister.m
//  IconFontRegister
//
//  Created by sungrow on 2019/3/15.
//

#import "UIImage+IconFontRegister.h"

@implementation UIImage (IconFontRegister)

+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                  backgroundColor:(UIColor *)bgColor
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets
                 imageOrientation:(UIImageOrientation)imageOrientation {
    return [self IFR_imageWithUnicode:unicode fontName:fontName gradientColors:@[bgColor] gradientLocations:@[] gradientStartPoint:CGPointZero gradientEndPoint:CGPointMake(size.width, size.height) iconColor:iconColor size:size imageInsets:insets imageOrientation:imageOrientation];
}

+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                   gradientColors:(NSArray <UIColor *>*)gradientColors
                gradientLocations:(NSArray <NSNumber *>*)gradientLocations
               gradientStartPoint:(CGPoint)gradientStartPoint
                 gradientEndPoint:(CGPoint)gradientEndPoint
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets
                 imageOrientation:(UIImageOrientation)imageOrientation {
    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }
    
    UIEdgeInsets imageInsets = insets;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat imageSizeW = size.width * scale;
    CGFloat imageSizeH = size.height * scale;
    
    CGFloat w1 = size.width - imageInsets.left - imageInsets.right;
    CGFloat w2 = size.height - imageInsets.top - imageInsets.bottom;
    CGFloat wh = MIN(w1, w2);
    CGFloat realSize = wh * scale;
    UIFont *font = [UIFont fontWithName:fontName size:realSize];
    
    UIGraphicsBeginImageContext(CGSizeMake(imageSizeW, imageSizeH));
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (gradientColors.count > 0) {
        // 绘制纯色背景
        if (gradientColors.count == 1) {
            [gradientColors.firstObject set];
            UIRectFill(CGRectMake(0.0, 0.0, imageSizeW, imageSizeH));
        }
        // 绘制渐变背景
        else {
            CGColorSpaceRef deviceRGB = CGColorSpaceCreateDeviceRGB();
            NSMutableArray *gradientCGColors = [NSMutableArray array];
            for (UIColor *color in gradientColors) {
                [gradientCGColors addObject:(id)color.CGColor];
            }
            
            CGFloat locationsFloat[[gradientLocations count]];
            for (int i = 0; i < [gradientLocations count]; i++) {
                NSNumber *number = [gradientLocations objectAtIndex:i];
                locationsFloat[i] = [number floatValue];
            }
            
            CGPoint startPoint = CGPointMake(gradientStartPoint.x * scale, gradientStartPoint.y * scale);
            CGPoint endPoint = CGPointMake(gradientEndPoint.x * scale, gradientEndPoint.y * scale);
            
            CGGradientRef gradient = CGGradientCreateWithColors(deviceRGB, (__bridge CFArrayRef)gradientCGColors, locationsFloat);
            CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
            CGColorSpaceRelease(deviceRGB);
            CGGradientRelease(gradient);
        }
    }
    
    CGPoint point = CGPointMake(imageInsets.left * scale, imageInsets.top * scale);
    if ([unicode respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        [unicode drawAtPoint:point withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: iconColor}];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, iconColor.CGColor);
        [unicode drawAtPoint:point withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:imageOrientation];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
