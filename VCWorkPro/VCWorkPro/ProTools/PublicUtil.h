//
//  PublicUtil.h
//  177Game
//
//  Created by apple on 2016/11/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PublicUtil : NSObject

+ (void)setCacheNavi:(UINavigationController *)nc;

+ (UINavigationController *)getCacheNavi;

//+ (UIViewController *)getCacheVC;
@end
