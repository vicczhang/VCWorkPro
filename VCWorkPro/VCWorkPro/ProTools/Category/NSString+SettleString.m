//
//  NSString+SettleString.m
//  177Game
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSString+SettleString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SettleString)

- (NSString *)replaceSpecialCode{
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return string;
}


- (CGFloat)heightForFont:(UIFont *)font width:(float)width {
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGRect sizeToFit = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return sizeToFit.size.height;
}


- (CGFloat)widthForFont:(UIFont *)font height:(float)height {
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGRect sizeToFit = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    
    return sizeToFit.size.width;
}


- (NSString *)md5Encryption
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSMutableAttributedString *)toAttributed:(CGFloat)fontSize color:(UIColor *)color{
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:self];
    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, self.length)];
    [attributed addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
    
    return attributed;
}

- (NSString *)toReportRequestString{
    if ([self isEqualToString:@"政治敏感"]) {
        return @"Political";
    }else if ([self isEqualToString:@"色情"]) {
        return @"Pornographic";
    }else if ([self isEqualToString:@"暴力"]) {
        return @"Violent";
    }else if ([self isEqualToString:@"广告"]) {
        return @"AD";
    }else{
        return @"Other";
    }
}
@end
