

#import <UIKit/UIKit.h>


@interface UIView (SetFrame)

/**
 设置 View Frame 的 X 坐标
 @param x X 坐标
 **/
- (void)setFrameX:(CGFloat)x;

/**
 设置 View Frame 的 Y 坐标
 @param y Y 坐标
 **/
- (void)setFrameY:(CGFloat)y;

/**
 设置 View Frame 的宽度
 @param width 宽度
 **/
- (void)setFrameWidth:(CGFloat)width;

/**
 设置 View Frame 的高度
 @param height 高度
 **/
- (void)setFrameHeight:(CGFloat)height;


/**
 设置 View Frame 的 X 坐标、Y 坐标
 @param x X 坐标
 @param y Y 坐标
 **/
- (void)setFrameX:(CGFloat)x y:(CGFloat)y;

/**
 设置 View Frame 的 X 坐标、宽度
 @param x X 坐标
 @param width 宽度
 **/
- (void)setFrameX:(CGFloat)x width:(CGFloat)width;

/**
 设置 View Frame 的 X 坐标、高度
 @param x X 坐标
 @param height 高度
 **/
- (void)setFrameX:(CGFloat)x height:(CGFloat)height;

/**
 设置 View Frame 的 Y 坐标、宽度
 @param y Y 坐标
 @param width 宽度
 **/
- (void)setFrameY:(CGFloat)y width:(CGFloat)width;

/**
 设置 View Frame 的 Y 坐标、高度
 @param y Y 坐标
 @param height 高度
 **/
- (void)setFrameY:(CGFloat)y height:(CGFloat)height;

/**
 设置 View Frame 的 X 宽度、高度
 @param width 宽度
 @param height 高度
 **/
- (void)setFrameWidth:(CGFloat)width height:(CGFloat)height;


/**
 设置 View Frame 的 X 坐标、Y 坐标、宽度
 @param x X 坐标
 @param y Y 坐标
 @param width 宽度
 **/
- (void)setFrameX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width;

/**
 设置 View Frame 的 X 坐标、Y 坐标、高度
 @param x X 坐标
 @param y Y 坐标
 @param height 高度
 **/
- (void)setFrameX:(CGFloat)x y:(CGFloat)y height:(CGFloat)height;

/**
 设置 View Frame 的 X 坐标、宽度、高度
 @param x X 坐标
 @param width 宽度
 @param height 高度
 **/
- (void)setFrameX:(CGFloat)x width:(CGFloat)width height:(CGFloat)height;

/**
 设置 View Frame 的 Y 坐标、宽度、高度
 @param y Y 坐标
 @param width 宽度
 @param height 高度
 **/
- (void)setFrameY:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

/**
 设置 View Center 的 Y 坐标
 @param y Y 坐标
 **/
- (void)setCenterY:(CGFloat)y;

/**
 设置 View Center 的 X 坐标
 @param x X 坐标
 **/
- (void)setCenterX:(CGFloat)x;

/**
 初始化大小
 **/
- (id)initWithSize:(CGSize)size;

/**
 设置 View 固定方位圆角
 @param size 圆角大小
 @param corners 圆角位置
 **/
- (void)setCornerSize:(CGSize)size roundingCorners:(UIRectCorner)corners;

/**
 设置底部线条
 **/
//- (void)addLineForBottom;

/**
 设置 View 阴影
 @param color 阴影颜色
 @param offset 阴影偏移量
 @param opacity 阴影不透明度
 @param radius 阴影半径
 **/
- (void)addShadowColor:(UIColor *)color shadowOffset:(CGSize)offset shadowOpacity:(float)opacity shadowRadius:(CGFloat)radius;

/**
 设置 view 圆角

 @param radius 圆角大小
 */
- (void)setCornersRadius:(CGFloat)radius;


/**
 设置边框颜色

 @param color 边框颜色
 */
- (void)setBorderColor:(UIColor *)color;

- (void)setBorderColor:(UIColor *)color :(CGFloat)width;

//@property (nonatomic, retain, readonly)UINavigationController* rooNC;

/**
 设置头部线条
 */
- (void)setTopLine;

/**
 设置底部线条
 */
- (void)setBottomLine;
@end
