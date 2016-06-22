//
//  BaseHeader.h
//  我们的旅行
//
//  Created by 佳佳 on 16/4/28.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h

#ifdef DEBUG //处于开发阶段
#define NSLog(...) NSLog(__VA_ARGS__)
#else //处于发布阶段
#define  NSLog(...)
#endif
//======================="  UIColor  "=================================

#define UIColorWithRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]
#define BgColor				UIColorWithRGB(251,247,237)
//------------------"  尺寸  "---------------
// 屏幕bounds
#define SScreenBounds [UIScreen mainScreen].bounds
// 屏幕的size
#define SScreenSize [UIScreen mainScreen].bounds.size
//宽度
#define SSWIDTH ([UIScreen mainScreen].bounds.size.width)
//高度
#define SSHEIGHT ([UIScreen mainScreen].bounds.size.height)

#define SSVCHeight (SSHEIGHT-64)
#define SSExtraHeight (64+49)
#define SSPureHeight (SSHEIGHT-64-49)
#define SSPureHeight45 (568-64-49)


#define RRect(a,b,c,d) CGRectMake(a,b,c,d)

#define RMaxX(frame)    CGRectGetMaxX(frame)
#define RMaxY(frame)    CGRectGetMaxY(frame)
#define RMinX(frame)    CGRectGetMinX(frame)
#define RMinY(frame)    CGRectGetMinY(frame)
#define RWidth(frame)   CGRectGetWidth(frame)
#define RHeight(frame)  CGRectGetHeight(frame)
//======================="  UIFont  "=================================
#define FFont(font) [UIFont systemFontOfSize:font]


#endif /* BaseHeader_h */
