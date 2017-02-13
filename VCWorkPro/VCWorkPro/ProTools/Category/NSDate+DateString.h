//
//  NSDate+DateString.h
//  177Game
//
//  Created by apple on 16/9/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateString)
/**
 获取时间字符串

 @param formatString 时间格式

 @return 时间
 */
- (NSString *)getDateString:(NSString *)formatString;


- (NSDate *)TC_dateByAddingCalendarUnits:(NSCalendarUnit)calendarUnit amount:(NSInteger)amount;
@end
