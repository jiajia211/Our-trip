//
//  StoryDetailViewController.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/24.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "BaseHeader.h"
#import "StroyDetailsHeadTableViewCell.h"
#import "StoryDetailTableViewCell.h"
#import "AFNetworkAPI.h"
#import "StoryDetailHeader.h"


@interface StoryDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *arrModel;
@property (strong, nonatomic) StoryDetailHeader *storyDetailModel;
@end

static NSString *const StoryDetailHeadCell = @"StoryDetailHeadCellKey";
static NSString *const StoryDetailCell     = @"StoryDetailCellKey";

@implementation StoryDetailViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [AFNetworkAPI StoryDetailsNetWorkRequestParams:@{@"spot_id":_spot_id} Target:self Select:@selector(StoryDetailsDataProcessing:)];
}
#pragma mark -UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section) {
        return self.arrModel.count;
    }else return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        StoryDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StoryDetailCell];
        cell.model = self.arrModel[indexPath.row];
        return cell;
    }else{
        StroyDetailsHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StoryDetailHeadCell];
        cell.storyDetailModel = self.storyDetailModel;
        return cell;
    }
}
#pragma mark -event response

-(void)StoryDetailsDataProcessing:(id)data{
    self.arrModel = data[@"arrModel"];
    _storyDetailModel = data[@"storyHeaderModel"];
    [self.tableView reloadData];
}

#pragma mark -setters and getters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:SScreenBounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 99;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor =BgColor;
        [_tableView registerNib:[UINib nibWithNibName:@"StroyDetailsHeadTableViewCell" bundle:nil] forCellReuseIdentifier:StoryDetailHeadCell];
        [_tableView registerNib:[UINib nibWithNibName:@"StoryDetailTableViewCell" bundle:nil] forCellReuseIdentifier:StoryDetailCell];
        self.title = @"故事详情";
    }
    return _tableView;
}
-(NSMutableArray *)arrModel{
    if (!_arrModel) {
        _arrModel = [NSMutableArray array];
    }
    return _arrModel;
}

@end
