//
//  BannerScrollView.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/4.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "BannerScrollView.h"
#import "Banner.h"
#import "BaseHeader.h"
#import <UIImageView+WebCache.h>
@interface BannerScrollView()<UIScrollViewDelegate>
@property (strong, nonatomic) UIPageControl *page;
@end
@implementation BannerScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, SSWIDTH, self.frame.size.height))];
        _scrollView.contentOffset = CGPointMake(0, 0);
        [self addSubview:_scrollView];
        
    }
    return self;
}

-(void)setScrollArr:(NSMutableArray *)scrollArr{
    _scrollArr = scrollArr;
    _scrollView.contentSize =CGSizeMake(SSWIDTH* (scrollArr.count),  0);
    for (int i = 0; i < scrollArr.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:RRect(i * SSWIDTH, 0, SSWIDTH, self.frame.size.height)];
        [img sd_setImageWithURL:[NSURL URLWithString:[scrollArr[i] image_url]] placeholderImage:nil];
        [_scrollView addSubview:img];
    }
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
   _scrollView.pagingEnabled = YES;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    if (x > (_scrollArr.count -1) * SSWIDTH) {
        [_scrollView setContentOffset:(CGPointMake(0, 0)) animated:YES];
    }
}
@end
