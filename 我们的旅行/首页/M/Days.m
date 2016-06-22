//
//  Days.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/26.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "Days.h"
#import "Waypoints.h"
@implementation Days
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"waypoints" : [Waypoints class]};
}
@end
