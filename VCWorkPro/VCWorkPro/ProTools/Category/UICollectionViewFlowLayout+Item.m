//
//  UICollectionViewFlowLayout+Item.m
//  VCWorkPro
//
//  Created by Apple on 2017/2/13.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "UICollectionViewFlowLayout+Item.h"

@implementation UICollectionViewFlowLayout (Item)

- (void)getVerticalLayout:(CGSize)itemSize{
    self.itemSize = itemSize;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    //    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
}

- (void)getHorizontalLayout:(CGSize)itemSize{
    self.itemSize = itemSize;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
}
@end
