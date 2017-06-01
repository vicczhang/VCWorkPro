//
//  NSMutableArray+Setting.m
//  TestSDKProject
//
//  Created by Apple on 2017/1/17.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "NSMutableArray+Setting.h"
#import "ListModel.h"

@implementation NSMutableArray (Setting)

- (void)loadResourcePath:(NSString *)path{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:@"plist"];
    
    [self addObjectsFromArray:[NSArray arrayWithContentsOfFile:filePath]];
    
    
    NSMutableArray* data = [NSMutableArray array];
    for (NSArray* dataArray in self) {
        NSMutableArray* listData = [ListModel arrayOfModelsFromDictionaries:dataArray error:nil];
        [data addObject:listData];
    }
    [self removeAllObjects];
    [self addObjectsFromArray:data];
}

- (void)loadDictResourcePath:(NSString *)path{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:@"plist"];
    
    
    NSMutableArray* data = [ListModel arrayOfModelsFromDictionaries:[NSArray arrayWithContentsOfFile:filePath] error:nil];
    [self removeAllObjects];
    [self addObjectsFromArray:data];

}

@end
