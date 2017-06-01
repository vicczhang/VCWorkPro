//
//  UIViewController+Navi.m
//  cyeducation
//
//  Created by Apple on 2017/2/28.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "UIViewController+Navi.h"

@implementation UIViewController (Navi)


-(void)naviLeftBack{
    
    UIButton* menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.frame = CGRectMake(0, 0, 10, 17);
    [menuButton setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(naviBackAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    UIBarButtonItem *leftNegative = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                     target:nil action:nil];
    leftNegative.width = 0;
    
    UIBarButtonItem *rightNegative = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                      target:nil action:nil];
    rightNegative.width = 10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftNegative, menuItem,rightNegative, nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}



- (void)naviBackAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)naviRightButton:(id)parameter withAction:(SEL)action{
    
    UIButton* menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.frame = CGRectMake(0, 0, 10, 10);
    if ([parameter isKindOfClass:[UIImage class]]) {
        [menuButton setImage:(UIImage *)parameter forState:UIControlStateNormal];
    }else{
        [menuButton setNormalTitle:(NSString *)parameter  titleColor:defaultTextColor];
        [menuButton setTitleFontSize:14];
    }
    [menuButton sizeToFit];
    [menuButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    UIBarButtonItem *rightNegative = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                      target:nil action:nil];
    rightNegative.width = 0;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightNegative, menuItem, nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}

-(void)naviLeftButton:(id)parameter withAction:(SEL)action{
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 149, 18);
    if ([parameter isKindOfClass:[UIImage class]]) {
        [leftButton setImage:(UIImage *)parameter forState:UIControlStateNormal];
    }else{
        [leftButton setNormalTitle:(NSString *)parameter  titleColor:systemWhiteColor];
        [leftButton setTitleFontSize:12];
    }
    [leftButton sizeToFit];
    [leftButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *leftNegative = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                     target:nil action:nil];
    leftNegative.width = 0;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftNegative, menuItem, nil];
    
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}

- (void)showNavigation{
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar lt_setBackgroundColor:navigationColor];
}

- (void)hiddenNavigation{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar lt_setBackgroundColor:systemClearColor];
}

- (void)noNaviBack{
    UIButton* backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"live_back"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn setFrameX:13 y:40];
    [[backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton* btn) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:backBtn];
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}



- (void)addActiongBGView:(CGFloat)fameY targetView:(UIView *)tview callBack:(ActionCallBack)callBack{
    UIButton* bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bgBtn.backgroundColor = systemWhiteColor;
    bgBtn.frame = CGRectMake(0, fameY, ScreenWidth, 40);
    [self.view addSubview:bgBtn];
    [bgBtn setBottomLine];
    [[bgBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (callBack) {
            callBack();
        }
    }];
    
    tview.frame = CGRectMake(10, 0, ScreenWidth - 40, 40);
    [bgBtn addSubview:tview];
    
    [bgBtn addRightArrows];
}
@end
