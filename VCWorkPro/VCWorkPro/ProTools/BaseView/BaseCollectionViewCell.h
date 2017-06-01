//
//  BaseCollectionViewCell.h
//  Lazy1
//
//  Created by  Developer on 16/6/18.
//  Copyright © 2016年 WELCommand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

//是否已初始化界面
@property (nonatomic, assign, readonly) BOOL didInitializeCellView;

/*
 *初始化 Cell View
 *请在子类中重写该方法，无需另外调用
 */
-(void)initializeCelllView;

/*
 *根据model 重新渲染 Cell View
 *@oaram cellModel Cell Model
 */
- (void)reloadCellViewWithModel:(id)cellModel;

/*
 *获取 Cell identifier
 */
+ (NSString *)getCellIdentifier;

/*
 *简单水平布局
 *@param size celSize
 */
+ (UICollectionViewFlowLayout *)getHorizontalSingleImageLayout:(CGSize)size;

/*
 *简单水平布局
 *@param size celSize
 */
+ (UICollectionViewFlowLayout *)getHorizontalLayout:(CGSize)size;

/**
 cell重用
 --- 必须在创建空间前调用
 */
- (void)reusingCell;
@end
