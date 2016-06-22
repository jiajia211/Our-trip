//
//  WonderfulContentTableViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/25.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "WonderfulContentTableViewCell.h"
#import "WonderfulDetails.h"
#import "Days.h"
#import "Waypoints.h"
#import "User.h"
#import <UIImageView+WebCache.h>
#import "BaseHeader.h"
@interface WonderfulContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picImgHeight;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *userPic;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end
@implementation WonderfulContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)setWaypointsModel:(Waypoints *)waypointsModel{
    _waypointsModel = waypointsModel;
    if (waypointsModel.w) {
        _picImgHeight.constant = ((SSWIDTH-40) / [waypointsModel.w integerValue]) * [waypointsModel.h integerValue];
        [_picImg sd_setImageWithURL:[NSURL URLWithString:waypointsModel.photo] placeholderImage:nil];
    }else _picImgHeight.constant = 0;
    
    _cityLabel.text = [NSString stringWithFormat:@"%@,%@,%@",waypointsModel.country,waypointsModel.province,waypointsModel.city];
    if (_cityLabel.text.length<3) {
        _cityLabel.hidden = YES;
    }
    _text.text = waypointsModel.text;
    _userName.text = waypointsModel.local_time;
}
@end
