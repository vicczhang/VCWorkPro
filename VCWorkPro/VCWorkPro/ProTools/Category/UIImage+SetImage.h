//
//  UIImage+SetImage.h
//  Fishing
//
//  Created by Apple on 2017/2/3.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SetImage)
+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;
@end
