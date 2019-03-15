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
    if (!bgColor) {
        bgColor = [UIColor clearColor];
    }
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
    if (bgColor) {
        [bgColor set];
        UIRectFill(CGRectMake(0.0, 0.0, imageSizeW, imageSizeH));
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
