
#import "UIView+SetFrame.h"

@implementation UIView (SetFrame)

- (void)setFrameX:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameY:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameWidth:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}


- (void)setFrameX:(CGFloat)x y:(CGFloat)y {
    self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x width:(CGFloat)width {
    self.frame = CGRectMake(x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x height:(CGFloat)height {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)setFrameY:(CGFloat)y width:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, y, width, self.frame.size.height);
}

- (void)setFrameY:(CGFloat)y height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, height);
}

- (void)setFrameWidth:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
}


- (void)setFrameX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width {
    self.frame = CGRectMake(x, y, width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x y:(CGFloat)y height:(CGFloat)height {
    self.frame = CGRectMake(x, y, self.frame.size.width, height);
}

- (void)setFrameX:(CGFloat)x width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(x, self.frame.origin.y, width, height);
}

- (void)setFrameY:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, y, width, height);
}

- (void)setCenterX:(CGFloat)x
{
    self.center = CGPointMake(x, self.center.y);
}

- (void)setCenterY:(CGFloat)y{
    self.center = CGPointMake(self.center.x,y);
}

- (id)initWithSize:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero, size};
    return [self initWithFrame:rect];
}

- (void)setCornerSize:(CGSize)size roundingCorners:(UIRectCorner)corners{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//- (void)addLineForBottom{
//    
//    UILabel* lblBottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame), .5f)];
//    [lblBottomLine setBackgroundColor:tytDefaultLineColor];
//    if (CGRectGetWidth(self.frame)<=0) {
//        [lblBottomLine setFrameWidth:SCREENWIDTH];
//        [lblBottomLine setFrameY:CGRectGetHeight(self.frame) - 2];
//    }
//    [self addSubview:lblBottomLine];
//    
////    DebugLog(@"%lf---->%lf",CGRectGetHeight(self.frame),CGRectGetWidth(self.frame));
//}


- (void)addShadowColor:(UIColor *)color shadowOffset:(CGSize)offset shadowOpacity:(float)opacity shadowRadius:(CGFloat)radius{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;//设置阴影的透明度(0~1之间，0表示完全透明)
    self.layer.shadowRadius = radius;
}


- (void)setCornersRadius:(CGFloat)radius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)setBorderColor:(UIColor *)color{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = .5f;
}

- (void)setBorderColor:(UIColor *)color :(CGFloat)width{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

//- (UINavigationController *)rooNC{
//    return (UINavigationController *)objc_getAssociatedObject(self, navigationKey);
//}


- (void)setTopLine{
    
    UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), .5f)];
    [line setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:line];
}

- (void)setBottomLine{
    UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame), .5f)];
    [line setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:line];
}



@end
