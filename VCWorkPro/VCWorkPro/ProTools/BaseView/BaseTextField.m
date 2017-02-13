//
//  BaseTextField.m
//  VCWorkPro
//
//  Created by Apple on 2017/2/13.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "BaseTextField.h"

#define inputTextHeight 44

@implementation BaseTextField

- (instancetype)initWithAccount{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, inputTextHeight);
        self.font = appFontSize(14);
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithPassword{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, inputTextHeight);
        self.font = appFontSize(14);
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.backgroundColor = [UIColor whiteColor];
        self.secureTextEntry = YES;
    }
    return self;
}
@end
