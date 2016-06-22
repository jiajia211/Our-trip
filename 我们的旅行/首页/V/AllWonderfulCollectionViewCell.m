//
//  AllWonderfulCollectionViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/9.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "AllWonderfulCollectionViewCell.h"
#import "Common.h"
#import "ALLStory.h"
#import <UIImageView+WebCache.h>
#import "User.h"
@interface AllWonderfulCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
@implementation AllWonderfulCollectionViewCell

- (void)awakeFromNib {
    [Common imageView:self cornerRadius:5 borderColor:nil borderWidth:0];
    [Common imageView:_icon cornerRadius:10 borderColor:nil borderWidth:0];
    [Common imageView:_pic cornerRadius:5 borderColor:nil borderWidth:0];
    // Initialization code
}
-(void)setALLStoryModel:(ALLStory *)ALLStoryModel{
    _ALLStoryModel = ALLStoryModel;
    [_pic sd_setImageWithURL:[NSURL URLWithString:ALLStoryModel.index_cover]];
    _title.text = ALLStoryModel.text;
    _name.text = ALLStoryModel.user.name;
    [_icon sd_setImageWithURL:[NSURL URLWithString:ALLStoryModel.user.avatar_m] placeholderImage:nil];
    _pic.contentMode = UIViewContentModeScaleAspectFill;
    _pic.clipsToBounds = YES;
}
@end
