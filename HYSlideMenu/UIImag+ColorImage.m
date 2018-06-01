//
//  UIImag+ColorImage.m
//  HYSlideMenu
//
//  Created by 华惠友 on 2018/5/25.
//  Copyright © 2018年 华惠友. All rights reserved.
//

#import "UIImag+ColorImage.h"

@implementation UIImage (ColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); UIGraphicsBeginImageContext(rect.size); CGContextRef context = UIGraphicsGetCurrentContext(); CGContextSetFillColorWithColor(context, [color CGColor]); CGContextFillRect(context, rect); UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext(); return image; }

@end
