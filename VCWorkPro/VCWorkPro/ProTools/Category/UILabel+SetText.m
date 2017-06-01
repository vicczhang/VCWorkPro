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

- (void)setProperty:(CGFloat)fontSize textColor:(UIColor *)textColor{
    self.font = appFontSize(fontSize);
    self.textColor = textColor;
}

- (void)setSpecialStr:(NSString *)speStr Color:(UIColor *)color FontSize:(CGFloat)size{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    
    NSArray* valueArray = [self.text interceptionOfsubString:speStr];
    NSRange speRange = [((NSValue *)valueArray[0]) rangeValue];
    
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++)
    {
        temp = [self.text substringWithRange:NSMakeRange(i, 1)];
        if( i >= speRange.location && i< speRange.location + speRange.length){
            [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,[UIFont systemFontOfSize:size],NSFontAttributeName, nil] range:NSMakeRange(i, 1)];
        }
    }
    
    self.attributedText = attributedString;
    
}
@end
