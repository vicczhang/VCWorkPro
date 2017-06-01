//
//  UIScrollView+Setting.m
//  177Game
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIScrollView+Setting.h"

@implementation UIScrollView (Setting)
- (void)endRefreshStatus{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}
@end
