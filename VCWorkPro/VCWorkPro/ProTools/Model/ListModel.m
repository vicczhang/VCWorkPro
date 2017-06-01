//
//  ListModel.m
//  TestSDKProject
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel
- (CGFloat)getWidth{
    if (_imgWidth) {
        return [_imgWidth floatValue];
    }
    return 0;
}
- (CGFloat)getHeight{
    if (_imgHeight) {
        return [_imgHeight floatValue];
    }
    
    return 0;
}
@end
