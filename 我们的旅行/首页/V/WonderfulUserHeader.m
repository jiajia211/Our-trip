//
//  WonderfulUserHeader.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/31.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "WonderfulUserHeader.h"
#import "WonderfulDetails.h"
#import "UIView+Frame.h"
#import "User.h"
#import <UIImageView+WebCache.h>
@interface WonderfulUserHeader()
@property (weak, nonatomic) IBOutlet UIImageView *avaPic;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *mileageLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@end
@implementation WonderfulUserHeader
-(void)setModel:(WonderfulDetails *)model{
    model = model;
    [self imageView:_avaPic cornerRadius:30 borderColor:[UIColor whiteColor] borderWidth:2];
    [_avaPic sd_setImageWithURL:[NSURL URLWithString:model.user.avatar_m]];
    _titleLabel.text = model.name;
    _timeLabel.text = model.first_day;
    _dayLabel.text = model.day_count;
    _mileageLabel.text = [NSString stringWithFormat:@"%@km",[model.mileage componentsSeparatedByString:@"."][0]] ;
    _likeLabel.text = model.recommendations;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
