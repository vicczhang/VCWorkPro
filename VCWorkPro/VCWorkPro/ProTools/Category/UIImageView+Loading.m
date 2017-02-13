//
//  UIImageView+Loading.m
//  177Game
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIImageView+Loading.h"
@implementation UIImageView (Loading)

- (void)imageAdaptive{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}
@end
