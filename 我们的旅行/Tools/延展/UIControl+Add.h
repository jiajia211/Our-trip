//
//  UIControl+Add.h
//  Yuanfuyun_1
//
//  Created by 佳佳 on 16/4/13.
//  Copyright © 2016年 罗小华. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickTag)(id sender);

@interface UIControl (Add)

-(void)ActionClick:(ClickTag)block;
@end
