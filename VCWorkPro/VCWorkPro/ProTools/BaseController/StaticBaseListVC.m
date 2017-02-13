//
//  StaticBaseListVC.m
//  Fishing
//
//  Created by Apple on 2017/2/4.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "StaticBaseListVC.h"
#import "StaticBaseListCell.h"

@interface StaticBaseListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation StaticBaseListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHadTabBarHeight) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview:_tableview];
        _tableview.tableFooterView = [UIView new];
    }
    return _tableview;
}

- (NSMutableArray *)list{
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_list.count>0) {
        NSArray* dataArray = _list[section];
        
        return dataArray.count;
    }
    return 0;
}
//NSString *const UserCellIdentifier = @"UserCellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StaticBaseListCell* cell = [tableView dequeueReusableCellWithIdentifier:[StaticBaseListCell getCellIdentifier]];
    if (!cell) {
        cell = [[StaticBaseListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[StaticBaseListCell getCellIdentifier]];
    }
    [cell setDefaultLineStyle];
    
    if (_list.count > 0) {
        NSMutableArray* dataArray = _list[indexPath.section];
        ListModel* model = dataArray[indexPath.row];
        if ([model.cellType isEqualToString:@"0"]) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = model.titleText;
            cell.detailTextLabel.text = model.detailText;
        }else if ([model.cellType isEqualToString:@"1"]){
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.text = model.titleText;
        }else if ([model.cellType isEqualToString:@"2"]){
            [cell reloadCellViewWithModel:model];
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableArray* dataArray = _list[indexPath.section];
    ListModel* model = dataArray[indexPath.row];
    if ([model.cellType isEqualToString:@"0"]) {
        model.detailText = @"已设置";
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    NSLog(@"%ld ----> %ld",indexPath.section,indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 12;
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
