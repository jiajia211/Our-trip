//
//  UIView+Frame.h
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 自己模仿frame写出他的四个属性
@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;

//圆角
-(UIView *)imageView:(UIView *)imageView cornerRadius:(NSUInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
@end
