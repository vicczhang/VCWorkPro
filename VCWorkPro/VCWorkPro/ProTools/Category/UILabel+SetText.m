//
//  UILabel+SetText.m
//  177Game
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UILabel+SetText.h"

@implementation UILabel (SetText)

- (void)setSizeToFitText:(NSString *)text maxWidth:(CGFloat)maxWidth{
    self.text = text;
    [self setFrameWidth:maxWidth];
    [self sizeToFit];
}

- (void)addShowColor:(UIColor *)color{
    self.shadowColor = color;  //设置文本的阴影色彩和透明度。
    self.shadowOffset = CGSizeMake(1.0f, 1.0f);//设置阴影的倾斜角度。
}
@end
