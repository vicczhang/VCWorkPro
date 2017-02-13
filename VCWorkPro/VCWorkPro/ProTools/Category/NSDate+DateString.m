//
//  NSDate+DateString.m
//  177Game
//
//  Created by apple on 16/9/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSDate+DateString.h"

@implementation NSDate (DateString)

- (NSString *)getDateString:(NSString *)formatString
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    return [formatter stringFromDate:self];
}

- (NSDate *)TC_dateByAddingCalendarUnits:(NSCalendarUnit)calendarUnit amount:(NSInteger)amount{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *gregorrian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *newDate;
    
    switch (calendarUnit) {
        case NSCalendarUnitSecond:
            [components setSecond:amount];
            break;
        case NSCalendarUnitMinute:
            [components setMinute:amount];
            break;
        case NSCalendarUnitHour:
            [components setHour:amount];
            break;
        case NSCalendarUnitDay:
            [components setDay:amount];
            break;
        case NSCalendarUnitWeekOfYear:
            [components setWeekOfYear:amount];
            break;
        case NSCalendarUnitMonth:
            [components setMonth:amount];
            break;
        case NSCalendarUnitYear:
            [components setYear:amount];
            break;
            
        default:
            DebugLog(@"addCalendar does not support that calendarUnit!");
            break;
    }
    
    newDate = [gregorrian dateByAddingComponents:components toDate:self options:0];
    return newDate;
}
@end
