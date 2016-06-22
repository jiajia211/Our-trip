//
//  Wonderful.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/5.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface Wonderful : NSObject
@property (nonatomic,copy) NSString *cover_image;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *first_day;
@property (nonatomic,copy) NSString *popular_place_str;
//@property (nonatomic,copy) NSString *day_count1;
//@property (nonatomic,copy) NSString *view_count1;
@property (nonatomic,copy) NSString *id;
@property (nonatomic,retain) User *user;
@end
