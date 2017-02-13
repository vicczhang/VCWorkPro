//
//  BaseTableViewCell.m
//  Lazy1
//
//  Created by  Developer on 16/6/18.
//  Copyright © 2016年 WELCommand. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}


-(instancetype)init{
    if (self = [super init]) {
        //初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

-(void)initialize{
    if (!self.didInitializeCellView) {
        // 实际是调用子类的方法
        [self initializeCellView];
        _didInitializeCellView = YES;
    }
}


- (void)initializeCellView{
    //  请在子类中重写该方法
}


- (void)reloadCellViewWithModel:(id)cellModel{
    // 请在子类中重写该方法
}

/*
 *获取 Cell Identifier
 */
+ (NSString *)getCellIdentifier{
    // self 为子类类型
    return [NSString stringWithFormat:@"%@Identifier",NSStringFromClass(self)];
}

static NSMutableDictionary *tempCells;
+ (CGFloat)getCellHeightWithModel:(id)cellModel{
    if (!tempCells) {
        tempCells = [[NSMutableDictionary alloc] init];
    }
    
    NSString *itemKey = NSStringFromClass(self);
    BaseTableViewCell *tempCell = [tempCells.allKeys containsObject:itemKey] ? tempCells[itemKey] : nil;
    if (!tempCell) {
        tempCell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [tempCells setValue:tempCell forKey:itemKey];
    }
    
    if (cellModel) {
        [tempCell reloadCellViewWithModel:cellModel];
        
        return tempCell.frame.size.height;
    }else{
        return 0;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDefaultLineStyle{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
