//
//  WonderfulDetailsViewController.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/25.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "WonderfulDetailsViewController.h"
#import "WonderfulUserHeader.h"
#import "WonderfulContentTableViewCell.h"
#import "BaseHeader.h"
#import "AFNetworkAPI.h"
#import "WonderfulDetails.h"
#import "Days.h"
#import "Waypoints.h"
#import <Masonry.h>

static NSString *const WonderfulUser       = @"WonderfulUserKey";
static NSString *const WonderfulContent    = @"WonderfulContentKey";
@interface WonderfulDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) WonderfulDetails *wonderfulDetailsModel;
@property (strong, nonatomic) WonderfulUserHeader *wonderHeaderView;
@end

@implementation WonderfulDetailsViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [AFNetworkAPI WonderfulDetailsNetWorkRequestParams:@{@"spid":_spid_id} Target:self Select:@selector(WonderfulDataProcessing:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _wonderfulDetailsModel.days.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_wonderfulDetailsModel.days[section] waypoints].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WonderfulContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WonderfulContent];
    cell.backgroundColor = BgColor;
    cell.waypointsModel = [_wonderfulDetailsModel.days[indexPath.section] waypoints][indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:RRect(0, 0, SSWIDTH, 30)];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"journey_table_header"]];
    [sectionHeaderView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sectionHeaderView.mas_left).offset(3);
        make.top.mas_equalTo(sectionHeaderView.mas_top);
        make.height.offset(30);
        make.width.offset(SSWIDTH-40);
    }];
    UILabel *timeLabel = [[UILabel alloc]init];
    [image addSubview:timeLabel];
    timeLabel.font = FFont(13);
    timeLabel.textColor = UIColorWithRGB(168, 145, 94);
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sectionHeaderView.mas_left).offset(38);
        make.top.mas_equalTo(sectionHeaderView.mas_top);
    }];
    Days *dayModel =_wonderfulDetailsModel.days[section];
    timeLabel.text = [NSString stringWithFormat:@"第%@天 %@",dayModel.day,dayModel.date];
    return sectionHeaderView;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
#pragma mark -event response
-(void)WonderfulDataProcessing:(id)data{
    _wonderfulDetailsModel = data[@"wonderfulModel"];
    
    self.wonderHeaderView.model =_wonderfulDetailsModel;
    [self.tableView reloadData];
}
#pragma mark -setters and getters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:RRect(0, 0, SSWIDTH, SSHEIGHT) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 99;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = BgColor;
        _tableView.showsHorizontalScrollIndicator = FALSE;
        _tableView.tableHeaderView = self.wonderHeaderView;
        [_tableView registerNib:[UINib nibWithNibName:@"WonderfulUserTableViewCell" bundle:nil] forCellReuseIdentifier:WonderfulUser];
        [_tableView registerNib:[UINib nibWithNibName:@"WonderfulContentTableViewCell" bundle:nil] forCellReuseIdentifier:WonderfulContent];
        self.title = @"精彩故事";
    }
    return _tableView;
}
-(WonderfulUserHeader *)wonderHeaderView{
    if (!_wonderHeaderView) {
        _wonderHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"WonderfulUserHeader" owner:nil options:nil]lastObject];
        _wonderHeaderView.backgroundColor  = BgColor;
        _wonderHeaderView.frame = RRect(0, 64, SSWIDTH , 315);
    }
    return _wonderHeaderView;
}


@end
