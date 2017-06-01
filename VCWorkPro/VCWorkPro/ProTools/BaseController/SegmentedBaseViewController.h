//
//  SegmentedBaseViewController.h
//  177Game
//
//  Created by apple on 2016/10/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedBaseViewController : UIViewController

@property (nonatomic, strong)UISegmentedControl* segMenu;
@property (nonatomic, strong)UIScrollView* scContent;
/**
 titleList.count == itemList.count
 =====>   count >=3
 */

@property(nonatomic, copy)NSArray<NSString *>* menuTitleList;

@property(nonatomic, copy)NSArray<UIView *>* menuItemList;

/**
 获取segindex回调
 默认nil
 */
@property (nonatomic, copy) void (^segIndexValue)(NSInteger index);
@end
