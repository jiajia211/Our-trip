//
//  HeaderInSectionView.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/4.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "HeaderInSectionView.h"

@interface HeaderInSectionView()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end
@implementation HeaderInSectionView


-(void)setIsTitle:(BOOL)isTitle{
    _isTitle = isTitle;
    if (isTitle) {
        _buttonView.hidden = YES;
        _title.text = @"精彩原创和专题";
    }
}
@end
