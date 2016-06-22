//
//  UIView+Frame.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}


- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}
/**
 *  设置圆角 边框
 *
 *  @param imageView    要变的view
 *  @param cornerRadius 圆角大小
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框大小
 *
 */
-(UIView *)imageView:(UIView *)imageView cornerRadius:(NSUInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.borderColor = borderColor.CGColor;
    imageView.layer.borderWidth =borderWidth;
    return imageView;
}
@end



