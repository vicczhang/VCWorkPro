//
//  StaticBaseListCell.m
//  TestSDKProject
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "StaticBaseListCell.h"
#import "SDImageCache.h"

@interface StaticBaseListCell ()

@property (nonatomic, strong)UIImageView* ivImage;
@property (nonatomic, strong)UILabel* lblText;

@property (nonatomic, strong)UILabel* lblAttachText;

@property (nonatomic, strong)ListModel* model;
//@property (nonatomic, strong)UILabel* line;
@end

@implementation StaticBaseListCell


- (void)initializeCellView{
    _ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(defaultOffset, 0, 15, 15)];
    [_ivImage setCenterY:40/2.0];
    //    _ivImage.image = [UIImage imageNamed:@"userIntegral"];
    [self addSubview:_ivImage];
    
    _lblText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_ivImage.frame) + 10, 0, 200, 15)];
    [_lblText setCenterY:_ivImage.center.y];
    //    _lblText.text = @"积分";
    _lblText.textColor = defaultTextColor;
    _lblText.font = appFontSize(15);
    [self addSubview:_lblText];
    
    _lblAttachText = [[UILabel alloc] initWithFrame:CGRectZero];
    _lblAttachText.textColor = defaultgrayColor;
    _lblAttachText.font = appFontSize(15);
    //    [self setAttachText:@"75M"];
    [self addSubview:_lblAttachText];
    
}


- (void)reloadCellViewWithModel:(id)cellModel{
    
    if ((self.model = (ListModel *)cellModel) &&
        [cellModel isKindOfClass:[ListModel class]]) {
        _ivImage.image = [UIImage imageNamed:self.model.image];
        if (!self.model.image || [self.model.image isEqualToString:@""]) {
            [_ivImage setFrameWidth:0 height:0];
            [_lblText setFrameX:CGRectGetMaxX(_ivImage.frame) + 10];
        }
        _lblText.text = self.model.text;
        [self setAttachText:self.model.attachText];
    }
}

-  (void)setAttachText:(NSString *)text{
    [_lblAttachText setSizeToFitText:text maxWidth:120];
    if ([self.model.text isEqualToString:@"清理缓存"]) {
        [_lblAttachText setSizeToFitText:[self transformCacheSize] maxWidth:120];
    }
    [_lblAttachText setFrameX:ScreenWidth - CGRectGetWidth(_lblAttachText.frame) - 30];
    [_lblAttachText setCenterY:_lblText.center.y];
}

- (NSString *)transformCacheSize{//
    NSInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
    float cache = cacheSize/1024.0/1024.0;
    
    if(cache > 1){
        return [NSString stringWithFormat:@"%.2fMB",cache];
    }else{
        cache = cache * 1024.0;
        return [NSString stringWithFormat:@"%.2fKB",cache];
    }
}

@end
