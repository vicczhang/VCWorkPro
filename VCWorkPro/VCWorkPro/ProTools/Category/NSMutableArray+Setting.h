//
//  NSMutableArray+Setting.h
//  TestSDKProject
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Setting)
/**
 loadArray

 @param path plistName
 */
- (void)loadResourcePath:(NSString *)path;

/**
 loadDict

 @param path plistName
 */
- (void)loadDictResourcePath:(NSString *)path;
@end
