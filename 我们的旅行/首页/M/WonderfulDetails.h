//
//  WonderfulDetails.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/25.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User,Days;
@interface WonderfulDetails : NSObject
@property (strong, nonatomic) User *user;//用户
@property (strong, nonatomic) NSString *name;//标题
@property (strong, nonatomic) NSString *first_day;//开始天数
@property (strong, nonatomic) NSString *day_count;
@property (strong, nonatomic) NSString *recommendations;//喜欢
@property (strong, nonatomic) NSString *mileage;//里程
@property (strong, nonatomic) NSMutableArray *days;//形成
@end
