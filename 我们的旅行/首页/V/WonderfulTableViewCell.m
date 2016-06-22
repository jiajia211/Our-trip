//
//  WonderfulTableViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/4.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "WonderfulTableViewCell.h"
#import "Wonderful.h"
#import <UIImageView+WebCache.h>
#import "User.h"
#import "Common.h"
@interface WonderfulTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *jianbian;

@end
@implementation WonderfulTableViewCell

- (void)awakeFromNib {
    [Common imageView:_userIcon cornerRadius:15 borderColor:nil borderWidth:0];
    [Common imageView:_bgImg cornerRadius:5 borderColor:nil borderWidth:0];
    [Common imageView:_jianbian cornerRadius:5 borderColor:nil borderWidth:0];
    [_jianbian.layer addSublayer:[self shadowAsInverse]];
    // Initialization code
}

-(void)setWonderfulModel:(Wonderful *)wonderfulModel{
    _wonderfulModel = wonderfulModel;
    _title.text = wonderfulModel.name;
    _time.text = wonderfulModel.first_day;
    _place.text = wonderfulModel.popular_place_str;
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:wonderfulModel.user.avatar_m] placeholderImage:nil];
    _name.text = wonderfulModel.user.name;
    [_bgImg sd_setImageWithURL:[NSURL URLWithString:wonderfulModel.cover_image] placeholderImage:nil];
    _bgImg.contentMode = UIViewContentModeScaleAspectFill;
    _bgImg.clipsToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (CAGradientLayer *)shadowAsInverse
{
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    CGRect newShadowFrame = CGRectMake(0, 0, SSWIDTH,200 );
    newShadow.frame = newShadowFrame;
    //添加渐变的颜色组合（颜色透明度的改变）
    newShadow.colors = [NSArray arrayWithObjects:
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor] ,
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.4] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.3] CGColor],
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor],
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.0] CGColor],
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor],
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.3] CGColor],
//                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.4] CGColor],
                        (id)[[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor],
                        nil];
    return newShadow;
}
@end
