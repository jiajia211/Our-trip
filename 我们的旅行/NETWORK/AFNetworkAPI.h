//
//  AFNetworkAPI.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/19.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetworkAPI : NSObject
#pragma mark -首页
+(void)HomeNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName;
#pragma mark -全部故事
+(void)ALLStoryNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName;
#pragma mark -故事详情
+(void)StoryDetailsNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName;
#pragma mark -精彩原创和专题
+(void)WonderfulDetailsNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName;
#pragma mark -用户
+(void)UserNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName;
@end
