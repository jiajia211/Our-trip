//
//  HomeViewController.m
//  我们的旅行
//
//  Created by 佳佳 on 16/4/28.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "HomeViewController.h"
#import "Banner.h"
#import "DailyStory.h"
#import "Wonderful.h"
#import "DailyTableViewCell.h"
#import "BannerScrollView.h"
#import "HeaderInSectionView.h"
#import "WonderfulTableViewCell.h"
#import "StoryViewController.h"
#import "AFNetworkAPI.h"
#import "UIControl+Add.h"
#import "BaseHeader.h"
#import "StoryDetailViewController.h"
#import "WonderfulDetailsViewController.h"
static NSString *const dailyCellKey  = @"cellKey1";
static NSString *const wonderCellKey = @"cellKey2";
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView      *tableView;
@property (strong, nonatomic) NSMutableArray   *bannerArr;
@property (strong, nonatomic) NSMutableArray   *dailyStoryArr;
@property (strong, nonatomic) NSMutableArray   *wonderfulArr;
@property (strong, nonatomic) BannerScrollView *bannerView;
@end

@implementation HomeViewController
#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    
    //网络请求
    [AFNetworkAPI HomeNetWorkRequestParams:nil Target:self Select:@selector(HomeDataProcessing:)];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section) {
        return self.wonderfulArr.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section) {
        WonderfulTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:wonderCellKey forIndexPath:indexPath];
        cell.backgroundColor         = BgColor;
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.wonderfulModel          = self.wonderfulArr[indexPath.row];
        return cell;
    }else{

        DailyTableViewCell *cell     = [tableView dequeueReusableCellWithIdentifier:dailyCellKey forIndexPath:indexPath];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        cell.DailyStoryArr           = self.dailyStoryArr;
        cell.collectionDidBlock      = ^(NSIndexPath *indexPatha){
            StoryDetailViewController *SDVC = [[StoryDetailViewController alloc]init];
            SDVC.spot_id = [self.dailyStoryArr[indexPatha.item] spot_id];
            [SDVC setHidesBottomBarWhenPushed:YES];
//            self.navigationController.navigationBarHidden = NO;
            [self.navigationController pushViewController:SDVC animated:YES];
        };
        return cell;
    }

}
#pragma mark -event response
-(void)HomeDataProcessing:(id)data{
    self.bannerArr            = data[@"bannerArrModel"];
    self.bannerView.scrollArr = self.bannerArr;
    self.dailyStoryArr        = data[@"dailyStoryArr"];
    self.wonderfulArr         = data[@"wonderfulArr"];
    [self.tableView reloadData];
}
#pragma mark -UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        return 200;
    }
    return 462;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderInSectionView *headerView = [[[NSBundle mainBundle]loadNibNamed:@"HeaderInSection" owner:nil options:nil]lastObject];
    headerView.backgroundColor      = BgColor;
    [headerView.allButton ActionClick:^(id sender) {
        
    UINavigationController *storyVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"storyVC"];
        [self.navigationController pushViewController:storyVC animated:YES];
    }];
    if (section) {

    headerView.isTitle              = YES;
    }

    return headerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WonderfulDetailsViewController *WDVC = [[WonderfulDetailsViewController alloc]init];
    WDVC.spid_id = [self.wonderfulArr[indexPath.row] id];
    [self.navigationController pushViewController:WDVC animated:YES];
}
#pragma mark -setters and getters
-(NSMutableArray *)bannerArr{
    if (!_bannerArr) {
        _bannerArr = [NSMutableArray array];
    }
    return _bannerArr;
}
-(NSMutableArray *)dailyStoryArr{
    if (!_dailyStoryArr) {
        _dailyStoryArr = [NSMutableArray array];
    }
    return _dailyStoryArr;
}
-(NSMutableArray *)wonderfulArr{
    if (!_wonderfulArr) {
        _wonderfulArr = [NSMutableArray array];
    }
    return _wonderfulArr;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView                              = [[UITableView alloc]initWithFrame:SScreenBounds style:(UITableViewStyleGrouped)];
        _tableView.estimatedRowHeight           = 99;
        _tableView.separatorStyle               = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight                    = UITableViewAutomaticDimension;
        _tableView.delegate                     = self;
        _tableView.dataSource                   = self;
        _tableView.separatorStyle               = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor              = BgColor;
        _tableView.tableHeaderView              = self.bannerView;
        [_tableView registerNib:[UINib nibWithNibName:@"DailyTableViewCell" bundle:nil] forCellReuseIdentifier:dailyCellKey];
        [_tableView registerNib:[UINib nibWithNibName:@"WonderfulTableViewCell" bundle:nil] forCellReuseIdentifier:wonderCellKey];
    }
    return _tableView;
}
-(BannerScrollView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[BannerScrollView alloc]initWithFrame:RRect(0,0, SSWIDTH, SSHEIGHT/3)];
    }
    return _bannerView;
}

@end
