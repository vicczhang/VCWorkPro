//
//  StaticBaseListCell.m
//  TestSDKProject
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "StaticBaseListCell.h"

@interface StaticBaseListCell ()

@property (nonatomic, strong)UIImageView* ivImage;
@property (nonatomic, strong)UILabel* lblText;

@property (nonatomic, strong)UILabel* lblAttachText;

@property (nonatomic, strong)ListModel* model;

@end

@implementation StaticBaseListCell


- (void)initializeCellView{
//    _ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(defaultOffset, 0, 15, 15)];
//    [_ivImage setCenterY:35/2.0];
//    //    _ivImage.image = [UIImage imageNamed:@"userIntegral"];
//    [self addSubview:_ivImage];
//    
    _lblText = [[UILabel alloc] initWithFrame:self.bounds];
    [_lblText setTextAlignment:NSTextAlignmentCenter];
    _lblText.textColor = [UIColor grayColor];
    _lblText.font = appFontSize(15);
    [self addSubview:_lblText];
//
//    
//    _lblAttachText = [[UILabel alloc] initWithFrame:CGRectZero];
//    _lblAttachText.textColor = tytTextGrayColor;
//    _lblAttachText.font = appFontSize(15);
//    //    [self setAttachText:@"75M"];
//    [self addSubview:_lblAttachText];
    
}


- (void)reloadCellViewWithModel:(id)cellModel{
    
    if ((self.model = (ListModel *)cellModel) &&
        [cellModel isKindOfClass:[ListModel class]]) {
        
        _lblText.text = [NSString stringWithFormat:@"%@%@",self.model.titleText,self.model.detailText];
        
    }
}

@end
