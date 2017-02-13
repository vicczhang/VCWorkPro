//
//  BaseTableViewCell.h
//  Lazy1
//
//  Created by  Developer on 16/6/18.
//  Copyright © 2016年 WELCommand. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseTableViewCell : UITableViewCell
// 是否已初始化界面
@property (nonatomic, assign, readonly) BOOL didInitializeCellView;

/*
 *初始化 Cell View
 *请在子类中重写该方法，无需另外调用
 */
- (void)initializeCellView;

/*
 *根据Model 重新渲染 Cell View
 @param cellModel Cell Model
 */
- (void)reloadCellViewWithModel:(id)cellModel;

/*
 *获取 Cell Identifier
 */
+ (NSString *)getCellIdentifier;

/*
 *获取 Cell 高度
 *@param cellModel Cell Model
 */
+ (CGFloat)getCellHeightWithModel:(id)cellModel;

- (void)setDefaultLineStyle;
@end
