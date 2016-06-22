//
//  userList.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/31.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "userList.h"

@implementation userList
+(NSDictionary *)modelCustomPropertyMapper{
    return @{@"followings_count":@"user_info.followings_count",
             @"followers_count":@"user_info.followers_count",
             @"name":@"user_info.name",
             @"location_name":@"user_info.location_name",
             @"cover":@"user_info.cover",
             @"avatar_m":@"user_info.avatar_m"};
}
@end
