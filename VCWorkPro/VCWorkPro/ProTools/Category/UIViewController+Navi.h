//
//  UIViewController+Navi.h
//  cyeducation
//
//  Created by Apple on 2017/2/28.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionCallBack)();

@interface UIViewController (Navi)
-(void)naviLeftBack;

-(void)naviRightButton:(id)parameter withAction:(SEL)action;

-(void)naviLeftButton:(id)parameter withAction:(SEL)action;

- (void)showNavigation;
- (void)hiddenNavigation;


- (void)noNaviBack;


- (void)addActiongBGView:(CGFloat)fameY targetView:(UIView *)tview callBack:(ActionCallBack)callBack;
@end
