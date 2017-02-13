//
//  UICollectionViewFlowLayout+Item.h
//  VCWorkPro
//
//  Created by Apple on 2017/2/13.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewFlowLayout (Item)

/**
 垂直布局

 @param itemSize cell/item大小
 */
- (void)getVerticalLayout:(CGSize)itemSize;

/**
 水平布局

 @param itemSize cell/item大小
 */
- (void)getHorizontalLayout:(CGSize)itemSize;
@end
