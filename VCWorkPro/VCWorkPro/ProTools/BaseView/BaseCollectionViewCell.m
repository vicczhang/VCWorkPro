//
//  BaseCollectionViewCell.m
//  Lazy1
//
//  Created by  Developer on 16/6/18.
//  Copyright © 2016年 WELCommand. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

-(instancetype)init{
    if (self = [super init]) {
        //  初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //  初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //  初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}


- (void)initialize{
    if (!self.didInitializeCellView) {
        // 实际是调用子类的方法
        [self initializeCelllView];
        _didInitializeCellView = YES;
    }
}


-(void)initializeCelllView{
    //请在子类中重写该方法
}


- (void)reloadCellViewWithModel:(id)cellModel{
    //请在子类中重写该方法
}

/*
 *获取 Cell identifier
 */
+ (NSString *)getCellIdentifier{
    return [NSString stringWithFormat:@"%@Identifier",NSStringFromClass(self)];
}

+ (UICollectionViewFlowLayout *)getHorizontalSingleImageLayout:(CGSize)size{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    return layout;
}


+ (UICollectionViewFlowLayout *)getHorizontalLayout:(CGSize)size{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0.0;
    
    return layout;
}

- (void)reusingCell{
    for (UIView* removeView in self.subviews) {
        [removeView removeFromSuperview];
    }
}
@end
