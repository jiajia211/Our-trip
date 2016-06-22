//
//  DailyTableViewCell.h
//  我们的旅行
//
//  Created by 佳佳 on 16/5/3.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didCollectionBlock)(NSIndexPath *indexPath);
@interface DailyTableViewCell : UITableViewCell

@property (strong, nonatomic) NSMutableArray *DailyStoryArr;
@property (copy, nonatomic) didCollectionBlock collectionDidBlock;

@end
