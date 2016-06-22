//
//  StoryDetailHeader.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/24.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface StoryDetailHeader : NSObject
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *view_count;
@property (strong, nonatomic) User *user;
@end
