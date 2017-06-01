//
//  UISegmentedControl+FastCreate.h
//  177Game
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (FastCreate)


/**
 UISegmentedControl

 @param fontSize     字体大小
 @param defaultColor 默认颜色
 @param selectColor  选中颜色

 @return UISegmentedControl
 */
+ (UISegmentedControl *)creatFontSize:(CGFloat)fontSize defaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor;
@end
