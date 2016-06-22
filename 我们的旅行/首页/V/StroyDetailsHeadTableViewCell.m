//
//  StroyDetailsHeadTableViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/23.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "StroyDetailsHeadTableViewCell.h"
#import "StoryDetailHeader.h"
#import "User.h"
#import "BaseHeader.h"
#import <UIImageView+WebCache.h>
@interface StroyDetailsHeadTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *view_count;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation StroyDetailsHeadTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = BgColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setStoryDetailModel:(StoryDetailHeader *)storyDetailModel{
    _storyDetailModel = storyDetailModel;
    [_icon sd_setImageWithURL:[NSURL URLWithString:storyDetailModel.user.avatar_m] placeholderImage:nil];
    _name.text = storyDetailModel.user.name;
    _address.text = storyDetailModel.name;
    _title.text = storyDetailModel.text;
    _view_count.text = [NSString stringWithFormat:@"%@浏览",storyDetailModel.view_count];
}
@end
