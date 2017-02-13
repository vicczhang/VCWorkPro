//
//  UITextField+Setting.m
//  TestSDKProject
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "UITextField+Setting.h"

@implementation UITextField (Setting)


- (void)setLeftImage:(NSString *)imageString{
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, CGRectGetHeight(self.frame))];
    UIImageView* ivLeft = [[UIImageView alloc] init];
    ivLeft.image = [UIImage imageNamed:imageString];
    [ivLeft sizeToFit];
    [leftView addSubview:ivLeft];
    [ivLeft setCenter:CGPointMake(CGRectGetWidth(leftView.frame)/2, CGRectGetHeight(leftView.frame)/2)];
    
    self.leftView = leftView;
    self.leftViewMode=UITextFieldViewModeAlways;
}

- (void)setPadding:(CGFloat)paddingValue{
    [self setValue:[NSNumber numberWithFloat:paddingValue] forKey:@"paddingLeft"];
    [self setValue:[NSNumber numberWithFloat:paddingValue] forKey:@"paddingRight"];
}
@end
