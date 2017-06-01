//
//  SegmentedBaseViewController.m
//  177Game
//
//  Created by apple on 2016/10/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SegmentedBaseViewController.h"
#import "UISegmentedControl+FastCreate.h"

@interface SegmentedBaseViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UILabel* lblSegLine;

@end

@implementation SegmentedBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self naviLeftBack];
    self.view.backgroundColor = VCBGLightGrayColor;
}

- (void)setMenuTitleList:(NSArray<NSString *> *)menuTitleList{
    _menuTitleList = menuTitleList;
    for (NSInteger i = 0; i<_menuTitleList.count; i++) {
        [self.segMenu insertSegmentWithTitle:_menuTitleList[i] atIndex:i animated:YES];
    }
    [_segMenu setSelectedSegmentIndex:0];
}
- (void)setMenuItemList:(NSArray<UIView *> *)menuItemList{
    _menuItemList = menuItemList;
    [self.scContent setContentSize:CGSizeMake(ScreenWidth * _menuItemList.count, CGRectGetHeight(self.scContent.frame))];
    for (NSInteger i = 0; i<_menuItemList.count; i++) {
        UIView* view = _menuItemList[i];
        [view setFrameX:i * CGRectGetWidth(self.scContent.frame) height:CGRectGetHeight(self.scContent.frame)];
        [self.scContent addSubview:view];
    }
}

//rac_newSelectedSegmentIndexChannelWithNilValue
- (UISegmentedControl *)segMenu{
    if (!_segMenu) {
        _segMenu = [UISegmentedControl creatFontSize:15 defaultColor:defaultTextColor selectColor:tabbarSelectColor];
        [_segMenu setBackgroundColor:systemWhiteColor];
        [self.view addSubview:_segMenu];
        [[_segMenu rac_newSelectedSegmentIndexChannelWithNilValue:@0]subscribeNext:^(NSNumber* index) {
            
            NSInteger selectedIndex = [index integerValue];
            
            [UIView animateWithDuration:0.3 animations:^{
                _scContent.contentOffset = CGPointMake(CGRectGetWidth(_scContent.frame) * selectedIndex, 0);
            }];
            CGFloat offsetX = selectedIndex * CGRectGetWidth(_scContent.frame)/_menuTitleList.count;
            // 切换视图
            if (_scContent.contentOffset.x != offsetX) {
                [_scContent setContentOffset:CGPointMake(selectedIndex * CGRectGetWidth(_scContent.frame), 0) animated:YES];
            }
            
        }];
    }
    return _segMenu;
}

- (UIScrollView *)scContent{
    if (!_scContent) {
        _scContent = [[UIScrollView alloc] init];
        CGFloat height = ScreenHadNaviHeight - CGRectGetMaxY(self.segMenu.frame);
        if (!self.hidesBottomBarWhenPushed) {
            height = ScreenHadTabBarHeight - CGRectGetMaxY(self.segMenu.frame);
        }
        _scContent.frame = CGRectMake(0, CGRectGetMaxY(self.segMenu.frame), ScreenWidth, height);
        [_scContent setBackgroundColor:systemClearColor];
        [self.view addSubview:_scContent];
        _scContent.delegate = self;
        [_scContent setPagingEnabled:YES];
        _scContent.showsVerticalScrollIndicator = NO;
        _scContent.showsHorizontalScrollIndicator = NO;
    }
    return _scContent;
}


#pragma mark -- scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (!(fmod(scrollView.contentOffset.x, scrollView.frame.size.width)) && scrollView == _scContent) {
        NSInteger page = scrollView.contentOffset.x / floor(CGRectGetWidth(scrollView.frame));
        _segMenu.selectedSegmentIndex = page;
        
        if (self.segIndexValue != nil) {
            self.segIndexValue(page);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
