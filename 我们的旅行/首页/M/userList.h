//
//  userList.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/31.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userList : NSObject
@property (copy, nonatomic) NSString *followings_count;//关注
@property (copy, nonatomic) NSString *followers_count;//粉丝
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *location_name;//所在地址
@property (copy, nonatomic) NSString *cover;//背景图
@property (copy, nonatomic) NSString *avatar_m;//用户头像
@property (strong, nonatomic) NSMutableArray *trips;//活动列表

@end
