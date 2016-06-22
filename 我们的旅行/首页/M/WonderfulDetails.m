//
//  WonderfulDetails.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/25.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "WonderfulDetails.h"
#import "Days.h"
@implementation WonderfulDetails
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"days" : [Days class]};
}
@end
