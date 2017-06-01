//
//  PublicUtil.m
//  177Game
//
//  Created by apple on 2016/11/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PublicUtil.h"

@implementation PublicUtil

+ (void)setCacheNavi:(UINavigationController *)nc{
    objc_setAssociatedObject(appdelegate,NavigationKey,nc,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UINavigationController *)getCacheNavi{
    return (UINavigationController *)objc_getAssociatedObject(appdelegate, NavigationKey);
}

//+ (UIViewController *)getCacheVC{
//    return (UIViewController *)objc_getAssociatedObject(appdelegate, ControllerKey);
//}
@end
