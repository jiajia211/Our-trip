//
//  StoryDetailTableViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/24.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "StoryDetailTableViewCell.h"
#import "StoryDetail.h"
#import <UIImageView+WebCache.h>
#import "BaseHeader.h"
@interface StoryDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoHeight;
@property (weak, nonatomic) IBOutlet UILabel *text;
@end
@implementation StoryDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = BgColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(StoryDetail *)model{
    _model = model;
    _photoHeight.constant = ((SSWIDTH-40) / [model.photo_width integerValue]) * [model.photo_height integerValue];
    [_photo sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:nil];
    _text.text = model.text;
}
@end
