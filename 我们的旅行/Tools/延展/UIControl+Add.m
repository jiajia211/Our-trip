//
//  UIControl+Add.m
//  Yuanfuyun_1
//
//  Created by 佳佳 on 16/4/13.
//  Copyright © 2016年 罗小华. All rights reserved.
//

#import "UIControl+Add.h"
#import <objc/runtime.h>
static const char ActionKey;
@implementation UIControl (Add)

-(void)ActionClick:(ClickTag)block{
    if (block) {
        objc_setAssociatedObject(self, &ActionKey, block, OBJC_ASSOCIATION_RETAIN);
    }
    [self addTarget:self action:@selector(Clicktarget:) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)Clicktarget:(id)sender{
    
    ClickTag block = objc_getAssociatedObject(self, &ActionKey);
    block(sender);
}

@end
