//
//  WorkPro.h
//  VCWorkPro
//
//  Created by Apple on 2017/2/13.
//  Copyright © 2017年 Vic. All rights reserved.
//

#ifndef WorkPro_h
#define WorkPro_h

/* pro import */
#import "NSMutableArray+Setting.h"
#import "UIImage+SetImage.h"
#import "UITextField+Setting.h"
#import "UIView+SetFrame.h"
#import "NSString+SettleString.h"
#import "UIButton+CountDown.h"
#import "UIImageView+Loading.h"
#import "NSDate+DateString.h"
#import "UITableView+SetLine.h"
#import "UILabel+SetText.h"
#import "UICollectionViewFlowLayout+Item.h"
//#import "UIViewController+Navi.h"
//#import "UINavigationBar+Awesome.h"
//#import "UIScrollView+Setting.h"

#import "BaseTableViewCell.h"
#import "StaticBaseListVC.h"
#import "AlterHandleHelper.h"
#import "BaseTextField.h"
#import "PublicUtil.h"

#define defaultOffset 13
#define defaultTextColor [UIColor blackColor]
#define defaultgrayColor [UIColor lightGrayColor]

/* App Deleagte */
#define appdelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define userLogin appdelegate.userInfoModel.nickname!=nil

/* App Debug */
#ifdef DEBUG
#define DebugLog(format, ...) NSLog(@"<%@ - line:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(format), ##__VA_ARGS__])
#else
#define DebugLog(...)
#endif

/* weak */
#define weakSelf(s) __weak typeof(s) weakSelf = s

/* color */
#define RGBColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define HEXColor(rgbValue, alphaValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

/* App Screen Size */
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenHadNaviHeight (ScreenHeight - NavigationBarHeight - StatusBarHeight)

#define ScreenHadTabBarHeight (ScreenHadNaviHeight - TabBarHeight)

#define NavigationBarHeight 44

#define TabBarHeight 49

#define StatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

/* App font Size */
#define appFontSize(f) [UIFont systemFontOfSize:f]
#define appBoldFontSize(f) [UIFont boldSystemFontOfSize:f]

/* App Singleton */

#define declare_singleton_for_class(classname) \
+ (classname*)shared##classname;


#define getSingletonClass(classname) \
[classname shared##classname]


#define synthesize_singleton_for_class(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \

#endif /* WorkPro_h */
