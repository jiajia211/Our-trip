//
//  User.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/3.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户model
 */
@interface User : NSObject
@property (copy, nonatomic) NSString *location_name;//地点
@property (copy, nonatomic) NSString *name;//名字
@property (copy, nonatomic) NSString *id;//用户id
@property (copy, nonatomic) NSString *avatar_m;//头像
@property (copy, nonatomic) NSString *user_desc;//用户简洁
@end
