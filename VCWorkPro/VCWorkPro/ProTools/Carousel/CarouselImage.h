//
//  CarouselImage.h
//  TestRAC
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeBannerModel;
@interface CarouselImage : UIView

+ (instancetype)sharedCarouselImage;
/**
 默认图片
 */
@property (nonatomic, strong)UIImage* defaultImage;

@property (nonatomic, strong)NSMutableArray* imageUrl;

/**
 轮播时间间隔
 */
@property (nonatomic, assign)NSTimeInterval autoDelay;
/**
 点击回调
 *///HomeBannerModel* model
@property (nonatomic,copy) void(^didSelectImageAtIndex)();
@end
