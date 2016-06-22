//
//  Waypoints.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/25.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Waypoints : NSObject
@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *local_time;
@property (strong, nonatomic) NSString *h;
@property (strong, nonatomic) NSString *w;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *country;//国家
@property (strong, nonatomic) NSString *province;//省
@property (strong, nonatomic) NSString *city;//城市
@end
