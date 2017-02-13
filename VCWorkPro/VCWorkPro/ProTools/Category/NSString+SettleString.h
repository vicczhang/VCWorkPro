//
//  NSString+SettleString.h
//  177Game
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SettleString)

/**
 替换转行符
 **/
- (NSString *)replaceSpecialCode;

/**
 根据宽度拿高度

 @param font  字体
 @param width 宽度

 @return 高度
 */
- (CGFloat)heightForFont:(UIFont *)font width:(float)width;
/**
 根据高度拿宽度
 
 @param font  字体
 @param height 高度
 
 @return 宽度
 */
- (CGFloat)widthForFont:(UIFont *)font height:(float)height;


/**
 md5加密

 @return 加密后字符串
 */
- (NSString *)md5Encryption;


- (NSMutableAttributedString *)toAttributed:(CGFloat)fontSize color:(UIColor *)color;



/**
 举报类型

 @return 返回举报对应的请求字符
 */
- (NSString *)toReportRequestString;
@end
