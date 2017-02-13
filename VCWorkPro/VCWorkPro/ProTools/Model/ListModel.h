//
//  ListModel.h
//  TestSDKProject
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ListModel : JSONModel

/**
 列表类型
 0：带右边箭头
 1：无箭头
 2：自定义cell(单一label)
 3：自定义cell 
 */
@property (nonatomic, strong)NSString<Optional>* cellType;

@property (nonatomic, strong)NSString<Optional>* titleText;
@property (nonatomic, strong)NSString<Optional>* detailText;

@property (nonatomic, strong)NSString<Optional>* cellImage;
@end
