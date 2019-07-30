//
//  YQViewController.m
//  IconFontRegister
//
//  Created by oxape on 03/15/2019.
//  Copyright (c) 2019 oxape. All rights reserved.
//

#import "YQViewController.h"
#import <IconFontRegister/IconFontRegister.h>

@interface YQViewController ()

@end

@implementation YQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    UIImage *image = [UIImage IFR_imageWithUnicode:@"\U0000eb74" fontName:@"YQIconFont" backgroundColor:UIColor.groupTableViewBackgroundColor iconColor:UIColor.redColor size:CGSizeMake(64, 64) imageInsets:UIEdgeInsetsMake(4, 4, 4, 4) imageOrientation:UIImageOrientationDownMirrored];
    
    UIImage *image = [UIImage IFR_imageWithUnicode:@"\U0000eb75" fontName:@"YQIconFont" gradientColors:@[UIColor.blueColor, UIColor.yellowColor] gradientLocations:@[@(0.0), @(1.0)] gradientStartPoint:CGPointZero gradientEndPoint:CGPointMake(64, 64) iconColor:UIColor.redColor size:CGSizeMake(64, 64) imageInsets:UIEdgeInsetsZero imageOrientation:UIImageOrientationDownMirrored strokeColor:UIColor.orangeColor strokeWidth:-2];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
