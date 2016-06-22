//
//  StoryViewController.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/6.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "StoryViewController.h"
#import "AFNetworkAPI.h"
#import "BaseHeader.h"
#import "AllWonderfulCollectionViewCell.h"
#import "StoryDetailViewController.h"
static NSString *const allWonderKey = @"allWonderfulKey";
@interface StoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collection;
@property (strong, nonatomic) NSMutableArray   *arrModel;
@end

@implementation StoryViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精选故事";
    [self.view addSubview:self.collection];
    [AFNetworkAPI ALLStoryNetWorkRequestParams:nil Target:self Select:@selector(ALLStoryDataProcessing:)];

    // Do any additional setup after loading the view.
}


#pragma mark -UITableViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrModel.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AllWonderfulCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:allWonderKey forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.ALLStoryModel = self.arrModel[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    StoryDetailViewController *SDVC = [[StoryDetailViewController alloc]init];
    SDVC.spot_id = [self.arrModel[indexPath.item] spot_id];
    [self.navigationController pushViewController:SDVC animated:YES];

}
#pragma mark - Private methods
-(void)ALLStoryDataProcessing:(id)data{
    self.arrModel = data[@"arrModel"];
    [self.collection reloadData];
}
#pragma mark -setters and getters
-(NSMutableArray *)arrModel{
    if (!_arrModel) {
        _arrModel = [NSMutableArray array];
    }
    return _arrModel;
}
-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize                    = CGSizeMake((SSWIDTH/2)-10, 199);
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        _collection                        = [[UICollectionView alloc]initWithFrame:SScreenBounds collectionViewLayout:layout];
        _collection.delegate               = self;
        _collection.dataSource             = self;
        _collection.showsVerticalScrollIndicator = NO;
        _collection.showsHorizontalScrollIndicator = FALSE;
        _collection.backgroundColor        = [UIColor clearColor];
        [_collection registerNib:[UINib nibWithNibName:@"AllWonderfulCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:allWonderKey];
    }
    return _collection;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
