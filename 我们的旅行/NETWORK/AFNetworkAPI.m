//
//  AFNetworkAPI.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/19.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "AFNetworkAPI.h"
#import <AFNetworking.h>
#import "Banner.h"
#import <YYModel.h>
#import "DailyStory.h"
#import "Wonderful.h"
#import <MBProgressHUD.h>
#import "ALLStory.h"
#import "StoryDetail.h"
#import "StoryDetailHeader.h"
#import "WonderfulDetails.h"
#import "Days.h"
#import "Waypoints.h"
#import "userList.h"
//首页
//全部故事

static NSString * const TravelURl    = @"http://api.breadtrip.com/v2/index/";

static NSString * const AllWonderful = @"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=";

static NSString * const StoryDeatils = @"http://api.breadtrip.com/v2/new_trip/spot/";

//static NSString * const WonderfulDeatils = @"http://api.breadtrip.com/trips/%@/waypoints/";


@interface AFNetworkAPI()

@end

@implementation AFNetworkAPI

#pragma mark -----------------------"  NetworkSession  "---------------------------------
#pragma mark 网络请求Get方式
+ (void)requestGetURl:(NSString *)URL withParameters:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure{
    NSLog(@"%@ %@",URL,params);
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    MBProgressHUD *hubView = [[MBProgressHUD alloc]initWithWindow:window];
    [window addSubview:hubView];
    [hubView show:YES];
    [[AFHTTPSessionManager manager]GET:URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [hubView hide:YES];
        if (responseObject){
            success(responseObject);		 //请求成功返回数据
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       failure(error);
    }];
    
    
}
#pragma mark -首页
+(void)HomeNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName{
    
    [AFNetworkAPI requestGetURl:TravelURl withParameters:params success:^(id data) {
        NSMutableArray *bannerArrModel = [NSMutableArray array];
        //轮播图
        NSArray *bannerArrOne = data[@"data"][@"elements"][0][@"data"][0];
        [bannerArrOne enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Banner *banner = [Banner yy_modelWithJSON:obj];
            [bannerArrModel addObject:banner];
        }];
        
        NSMutableArray *dailyStoryArr = [NSMutableArray array];
        NSMutableArray *wonderfulArr = [NSMutableArray array];
        //每日故事 //精彩游记
        NSArray *DailyStoryArrOne = data[@"data"][@"elements"];
        [DailyStoryArrOne enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj[@"type"] == [NSNumber numberWithInteger:10]) {
                DailyStory *daily = [DailyStory yy_modelWithJSON:obj[@"data"][0]];
                [dailyStoryArr addObject:daily];
            }
            
            if (obj[@"type"] == [NSNumber numberWithInteger:4]) {
                Wonderful *daily = [Wonderful yy_modelWithJSON:obj[@"data"][0]];
                [wonderfulArr addObject:daily];
            }
            
        }];
        
        
        [target performSelectorOnMainThread:selectName withObject:@{@"bannerArrModel":bannerArrModel,@"dailyStoryArr":dailyStoryArr,@"wonderfulArr":wonderfulArr} waitUntilDone:YES];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark -全部故事
+(void)ALLStoryNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName{
    [AFNetworkAPI requestGetURl:AllWonderful withParameters:params success:^(id data) {
        
        NSInteger  nextStatus = [data[@"status"] integerValue];
        NSMutableArray *hot_spot_listArr = data[@"data"][@"hot_spot_list"];
        NSMutableArray *arrModel = [NSMutableArray array];
        
        [hot_spot_listArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ALLStory *story = [ALLStory yy_modelWithDictionary:obj];
            [arrModel addObject:story];
        }];
        [target performSelectorOnMainThread:selectName withObject:@{@"arrModel":arrModel} waitUntilDone:YES];
    } failure:^(NSError *error) {
        
    }];

}
#pragma mark -故事详情
+(void)StoryDetailsNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName{
    
    [AFNetworkAPI requestGetURl:StoryDeatils withParameters:params success:^(id data) {
        NSMutableArray *detail_list = data[@"data"][@"spot"][@"detail_list"];
        NSMutableArray *arrModel = [NSMutableArray array];
        [detail_list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            StoryDetail *model = [StoryDetail yy_modelWithDictionary:obj];
            [arrModel addObject:model];
        }];
        StoryDetailHeader *storyHeader = [StoryDetailHeader yy_modelWithDictionary:data[@"data"]];
        
        [target performSelectorOnMainThread:selectName withObject:@{@"arrModel":arrModel,@"storyHeaderModel":storyHeader} waitUntilDone:YES];
    } failure:^(NSError *error) {
        
    }];

}
#pragma mark -精彩原创和专题
+(void)WonderfulDetailsNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName{
    
    NSString *url = [NSString stringWithFormat:@"http://api.breadtrip.com/trips/%@/waypoints/",params[@"spid"]];
    [AFNetworkAPI requestGetURl:url withParameters:nil success:^(id data) {
        WonderfulDetails *wonderfulModel = [WonderfulDetails yy_modelWithDictionary:data];
        [target performSelectorOnMainThread:selectName withObject:@{@"wonderfulModel":wonderfulModel} waitUntilDone:YES];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark -用户
+(void)UserNetWorkRequestParams:(NSDictionary *)params Target:(id)target Select:(SEL)selectName{
    NSString *url = [NSString stringWithFormat:@"http://api.breadtrip.com/v2/users/%@/",params[@"id"]];
    [AFNetworkAPI requestGetURl:url withParameters:nil success:^(id data) {
        userList *userModel = [userList yy_modelWithDictionary:data[@"data"]];
        [target performSelectorOnMainThread:selectName withObject:@{@"userModel":userModel} waitUntilDone:YES];
    } failure:^(NSError *error) {
        
    }];
}
@end
