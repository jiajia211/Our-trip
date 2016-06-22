//
//  StoryDetailHeader.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/24.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "StoryDetailHeader.h"

@implementation StoryDetailHeader
+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"view_count":@"spot.view_count",
             @"text":@"spot.text",
             @"name":@"spot.poi.name",
             @"user":@"trip.user",};
}
@end
