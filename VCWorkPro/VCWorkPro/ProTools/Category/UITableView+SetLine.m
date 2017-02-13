//
//  UITableView+SetLine.m
//  177Game
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UITableView+SetLine.h"

@implementation UITableView (SetLine)

- (void)settingDefaultLineStyle{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.separatorColor = [UIColor lightGrayColor];
}

- (void)settingLineStyle:(CGFloat)leftInset{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0, leftInset, 0, 0)];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0, leftInset, 0, 0)];
    }
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.separatorColor = [UIColor lightGrayColor];
}


@end
