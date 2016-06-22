//
//  DailyTableViewCell.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/3.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "DailyTableViewCell.h"
#import "BaseHeader.h"
#import "DailyCollectionViewCell.h"
static NSString *const collectionkey = @"collectonKeyCell";
@interface DailyTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *collection;
}
@end
@implementation DailyTableViewCell

- (void)awakeFromNib {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake((SSWIDTH/2)-10, 221);
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        collection = [[UICollectionView alloc]initWithFrame:RRect(0, 0, SSWIDTH, 462) collectionViewLayout:layout];
        [collection registerNib:[UINib nibWithNibName:@"DailyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionkey];
        collection.delegate = self;
        collection.backgroundColor = BgColor;
        collection.dataSource = self;
        [self addSubview:collection];
    });

    // Initialization code
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.collectionDidBlock(indexPath);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DailyCollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:collectionkey forIndexPath:indexPath];
    if (_DailyStoryArr.count) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.DailyStorymodel = _DailyStoryArr[indexPath.item];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setDailyStoryArr:(NSMutableArray *)DailyStoryArr{
    _DailyStoryArr = DailyStoryArr;
    [collection reloadData];
}
@end
