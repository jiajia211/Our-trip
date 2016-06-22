//
//  ALLStory.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/23.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface ALLStory : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *index_cover;
@property (nonatomic,retain) NSDictionary *poi;
@property (nonatomic,retain) User *user;
@property (nonatomic,copy) NSString *spot_id;
@end
