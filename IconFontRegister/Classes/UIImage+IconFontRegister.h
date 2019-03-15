//
//  UIImage+IconFontRegister.h
//  IconFontRegister
//
//  Created by sungrow on 2019/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (IconFontRegister)

+ (UIImage *)IFR_imageWithUnicode:(NSString *)unicode
                         fontName:(NSString *)fontName
                  backgroundColor:(UIColor *)bgColor
                        iconColor:(UIColor *)iconColor
                             size:(CGSize)size
                      imageInsets:(UIEdgeInsets)insets;

@end

NS_ASSUME_NONNULL_END
