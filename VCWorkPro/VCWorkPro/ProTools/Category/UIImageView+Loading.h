//
//  UIImageView+Loading.h
//  177Game
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Loading)
//
///**
// 异步加载图片（显示进度）
//
// @param URLString 图片地址
// @param placeholderImageString 默认图片名
// */
//- (void)setProgressImageURL:(NSString *)URLString placeholderImage:(NSString *)placeholderImageString;
//
///**
// 异步加载图片(不显示进度)
//
// @param URLString              图片地址
// @param placeholderImageString 默认图片名
// */
//- (void)setImageURL:(NSString *)URLString placeholderImage:(NSString *)placeholderImageString;

/**
 设置图片适配
 */
- (void)imageAdaptive;
@end
