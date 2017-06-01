//
//  ListModel.h
//  TestSDKProject
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ListModel : JSONModel

@property (nonatomic, copy)NSString<Optional>* cellType;
@property (nonatomic, copy)NSString<Optional>* text;
@property (nonatomic, copy)NSString<Optional>* image;
@property (nonatomic, copy)NSString<Optional>* pushVC;
@property (nonatomic, copy)NSString<Optional>* attachText;

@property (nonatomic, copy)NSString<Optional>* imgWidth;
@property (nonatomic, copy)NSString<Optional>* imgHeight;

- (CGFloat)getWidth;
- (CGFloat)getHeight;
@end
