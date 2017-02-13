//
//  BaseTextField.h
//  VCWorkPro
//
//  Created by Apple on 2017/2/13.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextField : UITextField

/**
 创建账号输入框

 @return accountTextField
 */
- (instancetype)initWithAccount;

/**
 创建密码输入框

 @return PasswordTextField
 */
- (instancetype)initWithPassword;
@end
