//
//  UILabel+SetText.h
//  177Game
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SetText)


/**
 Label自适应文字

 @param text     内容
 @param maxWidth 最大宽度
 */
- (void)setSizeToFitText:(NSString *)text maxWidth:(CGFloat)maxWidth;


/**
 设置阴影

 @param color 阴影颜色
 */
- (void)addShowColor:(UIColor *)color;

@end
