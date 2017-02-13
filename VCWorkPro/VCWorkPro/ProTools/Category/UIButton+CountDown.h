//
//  UIButton+CountDown.h
//  TYTGame
//
//  Created by  Developer on 16/6/18.
//  Copyright © 2016年  Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/*
 *UIButton 制作倒计时
 *@param timeLine 倒计时总时间
 *@param title 还没倒计时的title
 *@param endTitle 结束后title
 *@param subTitle 倒计时时的子名字，如时，分
 *@param mColor 还没倒计时时的颜色
 *@param color 倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
             endTitle:(NSString *)endTitle
       countDownTitle:(NSString *)subTitle
            mainColor:(UIColor *)mColor
           countColor:(UIColor *)color;


/**
 设置默认显示字符及颜色

 @param title 要显示的字符
 @param color 默认字符颜色
 */
- (void)setNormalTitle:(NSString *)title titleColor:(UIColor *)color;

/**
 设置字符串字体大小

 @param fontSize 字体大小
 */
- (void)setTitleFontSize:(float)fontSize;

/**
 设置默认的背景图片

 @param imgString 图片名字
 */
- (void)setNormalBgImage:(NSString *)imgString;

/**
 设置点击的背景图片

 @param imgString 图片名字
 */
- (void)setHighlightedBgImage:(NSString *)imgString;

/**
 设置单选按钮

 @param normalImgString 默认图片
 @param selectImgString 选中图片
 */
- (void)setSingleSelectionNormalImage:(NSString *)normalImgString selectImage:(NSString *)selectImgString;
@end
