//
//  CarouselImage.m
//  TestRAC
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CarouselImage.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
//#import "HomeBannerModel.h"
//#import "WebVC.h"
@interface CarouselImage ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)NSMutableArray* images;
//@property (nonatomic, strong)NSMutableArray* titles;
@property (nonatomic, strong)NSTimer* timer;
@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)UIPageControl* page;
@end
NSString*const carouselImageIdetifier = @"carouselImageIdetifier";

#define defaultDelay 3.0f
#define defaultSection 100/2
#define defaultHeight 150
@implementation CarouselImage

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, defaultHeight);
        [self getCarouselImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self getCarouselImageView];
    }
    return self;
}

+ (instancetype)sharedCarouselImage{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, defaultHeight)];
}


- (void)getCarouselImageView{
    [self setBackgroundColor:[UIColor whiteColor]];
    self.images = [NSMutableArray arrayWithObjects:@"",@"", nil];
//    self.titles = [NSMutableArray arrayWithObjects:@"",@"", nil];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:carouselImageIdetifier];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:defaultSection] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(_collectionView.frame) - 20,80, 7)];
    _page.pageIndicatorTintColor = [UIColor whiteColor];
    _page.currentPageIndicatorTintColor =  [UIColor blackColor];
    _page.numberOfPages = _images.count;
    _page.currentPage = 0;
    
    [_page setCenter:CGPointMake(CGRectGetWidth(self.frame)/2.0, _page.center.y)];
    [self addSubview:_page];
}



#pragma mark- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:carouselImageIdetifier forIndexPath:indexPath];
    for (UIView* v in cell.subviews) {
        [v removeFromSuperview];
    }
    
    UIImageView* iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [iv imageAdaptive];
    [cell addSubview:iv];
//    HomeBannerModel* model = _images[indexPath.row];
//    if ([model isKindOfClass:[HomeBannerModel class]]) {
//        [iv sd_setImageWithURL:appJointUrl(APPMainUrl,[model.bannerPic formatFirstElement]) placeholderImage:_defaultImage];
//    }else{
        iv.image = _defaultImage;
//    }

    //
//    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(iv.frame) - 20, CGRectGetWidth(iv.frame), 20)];
//    [title setBackgroundColor:[UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:.8f]];
//    title.text = @"aaaa";
//    title.font = [UIFont systemFontOfSize:12];
//    title.textColor = [UIColor blackColor];
//    [iv addSubview:title];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    HomeBannerModel* model = _images[indexPath.row];
//    WebVC* vc = [[WebVC alloc] init];
//    vc.urlString = model.clickUrl;
//    [[PublicUtil getCacheNavi] pushViewController:vc animated:YES];
//    if (self.didSelectImageAtIndex) {
//        self.didSelectImageAtIndex();
//    }
    
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

#pragma mark 当用户停止的时候调用
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
    [self nextpage];
}

#pragma mark 设置页码
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.images.count>0) {
        int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.images.count;
        _page.currentPage = page;
    }
    
}


#pragma mark 添加定时器
-(void)addTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:_autoDelay target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer ;
}

#pragma mark 删除定时器
-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextpage{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:defaultSection];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item +1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem==self.images.count) {
        nextItem=0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark -- setter

- (void)setAutoDelay:(NSTimeInterval)autoDelay{
    if (autoDelay <= 1) {
        autoDelay = defaultDelay;
    }
    _autoDelay = autoDelay;
    [self addTimer];
}

- (void)setImageUrl:(NSMutableArray *)imageUrl{
    _imageUrl = imageUrl;
    [self.images removeAllObjects];
    [self.images addObjectsFromArray:imageUrl];
    _page.numberOfPages = _images.count;
    [self.collectionView reloadData];
}

- (void)setDefaultImage:(UIImage *)defaultImage{
    _defaultImage = defaultImage;
    
}
@end
