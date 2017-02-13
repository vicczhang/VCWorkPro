//
//  AlterHandleHelper.m
//  TYTGame
//
//  Created by apple on 16/9/8.
//  Copyright © 2016年  Developer. All rights reserved.
//

#import "AlterHandleHelper.h"
#import "MBProgressHUD.h"
#import "NSString+SettleString.h"
#import <ReactiveObjC.h>

@implementation AlterHandleHelper

#define isSystemVersionBelowiOS8 [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0

+ (void)alertDisappearMessage:(NSString *)message{
    CGFloat maxWidth = ScreenWidth - 4 * 20;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.text = message;
    messageLabel.numberOfLines = 0;
    [messageLabel setFrameWidth:maxWidth height:0];
    [messageLabel sizeToFit];
    UIView *customView = [[UIView alloc] initWithSize:CGSizeMake(messageLabel.frame.size.width + 20.0, messageLabel.frame.size.height)];
    [customView addSubview:messageLabel];
    customView.layer.cornerRadius = 10.0;
    [messageLabel setCenter:CGPointMake(CGRectGetWidth(customView.frame)/2, CGRectGetHeight(customView.frame)/2)];
    hud.customView = customView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.618];
}
+ (void)alterMessage:(NSString *)message{
    
    [[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}

+ (void)alterMessage:(NSString *)message forVC:(UIViewController *)vc conformCallBack:(AlterConfirmCallBack)confirm{
    
    if (isSystemVersionBelowiOS8) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [[alertView rac_buttonClickedSignal] subscribeNext:^(NSNumber *indexNumber) {
            
            if ([indexNumber intValue] == 1) {
                DebugLog(@"cancle click!");
            }else{
                confirm();
            }
        }];
        [alertView show];
    }else{
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            confirm();
        }];
        
        [alertVC addAction:action1];
        [alertVC addAction:action2];
        
        [vc presentViewController:alertVC animated:YES completion:nil];
    }
}
@end
