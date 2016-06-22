//
//  DailyCollectionViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/4.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "DailyCollectionViewCell.h"
#import "DailyStory.h"
#import "User.h"
#import "Common.h"
#import <UIImageView+WebCache.h>
@interface DailyCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
@implementation DailyCollectionViewCell

- (void)awakeFromNib {
    
    self.backgroundColor = [UIColor whiteColor];
    [Common imageView:_pic cornerRadius:5 borderColor:nil borderWidth:0];
    [Common imageView:_icon cornerRadius:15 borderColor:nil borderWidth:0];
}
-(void)setDailyStorymodel:(DailyStory *)DailyStorymodel{
    _DailyStorymodel = DailyStorymodel;
    _text.text = DailyStorymodel.text;
    [_pic sd_setImageWithURL:[NSURL URLWithString:DailyStorymodel.index_cover] placeholderImage:nil];
    _pic.contentMode = UIViewContentModeScaleAspectFill;
    _pic.clipsToBounds = YES;
    [_icon sd_setImageWithURL:[NSURL URLWithString:DailyStorymodel.user.avatar_m] placeholderImage:nil];
    _name.text = DailyStorymodel.user.name;
}
@end
