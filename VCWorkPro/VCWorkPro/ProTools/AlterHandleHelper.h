//
//  AlterHandleHelper.h
//  TYTGame
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年  Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^AlterConfirmCallBack)();

@interface AlterHandleHelper : NSObject
/**
 弹出窗
 @param message 弹出消息
 @param vc 当前controller
 @param confirm 点击确定回调
 **/
+ (void)alterMessage:(NSString *)message forVC:(UIViewController *)vc conformCallBack:(AlterConfirmCallBack)confirm;


/**
 弹出提示

 @param message 提示内容
 */
+ (void)alterMessage:(NSString *)message;


/**
 弹出提示(自动消失)

 @param message 提示内容
 */
+ (void)alertDisappearMessage:(NSString *)message;

@end
