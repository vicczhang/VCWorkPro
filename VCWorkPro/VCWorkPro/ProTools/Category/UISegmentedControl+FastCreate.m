//
//  UISegmentedControl+FastCreate.m
//  177Game
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UISegmentedControl+FastCreate.h"

@implementation UISegmentedControl (FastCreate)

+ (UISegmentedControl *)creatFontSize:(CGFloat)fontSize defaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor{
    
    UISegmentedControl*segmented = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0,0,ScreenWidth,35)];
    segmented.backgroundColor = [UIColor whiteColor];
    segmented.tintColor = [UIColor clearColor];
    NSDictionary *selectedAttrs = @{ NSForegroundColorAttributeName:selectColor,
                                     NSFontAttributeName:[UIFont systemFontOfSize:fontSize] };
    [segmented setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    NSDictionary* unselectedAttrs = @{ NSForegroundColorAttributeName:defaultColor ,NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    [segmented setTitleTextAttributes:unselectedAttrs forState:UIControlStateNormal];
    
    
    return segmented;
}
@end
