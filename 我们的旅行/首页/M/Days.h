//
//  Days.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/26.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Waypoints;
@interface Days : NSObject
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSArray *waypoints;
@end
