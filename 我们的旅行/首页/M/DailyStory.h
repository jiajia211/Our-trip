//
//  DailyStory.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/3.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  每日精选故事
 */
@class User;
@interface DailyStory : NSObject
@property (copy, nonatomic) NSString *text;//内容
@property (copy, nonatomic) NSString *index_cover;//标题icon
@property (strong, nonatomic) User *user;//用户
@property (copy, nonatomic) NSString *spot_id;//id
@end
