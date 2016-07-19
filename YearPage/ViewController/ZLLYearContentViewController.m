//
//  ZLLYearContentViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearContentViewController.h"
#import "ZLLContentCell.h"
#import "ZLLContentViewModel.h"
#import "ZLLYearDetailsViewController.h"

static NSString * const reuseIdentifier = @"contentCell";
@interface ZLLYearContentViewController ()
/** <# #>  */
@property (nonatomic) ZLLContentViewModel *contentVM;
/** <# #>  */
@property (nonatomic) UIView *headerView;
@end

@implementation ZLLYearContentViewController
#pragma mark - lifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ZLLContentCell class] forCellReuseIdentifier:reuseIdentifier];
    self.tableView.tableHeaderView = self.headerView;
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.contentVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
            if (weakSelf.contentVM.hasMore) {
                [weakSelf.tableView endFooterRefresh];
            }else{
                [weakSelf.tableView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.contentVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.tableView reloadData];
            if (weakSelf.contentVM.hasMore) {
                [weakSelf.tableView endFooterRefresh];
            }else{
                [weakSelf.tableView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLLContentCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.iconIV  sd_setImageWithURL:[self.contentVM iconIVForRow:indexPath.row]];
    cell.desc.text = [self.contentVM descForRow:indexPath.row];
    cell.title.text = [self.contentVM titleForRow:indexPath.row];
    cell.readtime.text = [NSString stringWithFormat:@"阅读  %ld", [self.contentVM readtimeForRow:indexPath.row]];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZLLYearDetailsViewController *detailsVC = [ZLLYearDetailsViewController new];
    detailsVC.imageURL = [self.contentVM iconIVForRow:indexPath.row];
    detailsVC.iconURL = [self.contentVM iconForROW:indexPath.row];
    detailsVC.textURL = [self.contentVM textURLForRow:indexPath.row];
    detailsVC.title = [self.contentVM titleForRow:indexPath.row];
    detailsVC.name = [self.contentVM nameForRow:indexPath.row];
    detailsVC.desc = [self.contentVM descForRow:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - lazyLoad 懒加载

- (ZLLContentViewModel *)contentVM {
	if(_contentVM == nil) {
        _contentVM = [[ZLLContentViewModel alloc] initWithRID:self.rID];
	}
	return _contentVM;
}

- (UIView *)headerView {
	if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
        _headerView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
        UILabel *title = [UILabel new];
        [self.headerView addSubview: title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(0);
        }];
        title.textColor = [UIColor redColor];
        title.font = [UIFont systemFontOfSize:18];
        title.text = self.rTitle;
        UILabel *desc = [UILabel new];
        [self.headerView addSubview: desc];
        [desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-2);
            make.centerX.equalTo(0);
        }];
        desc.font = [UIFont systemFontOfSize:14];
        desc.textColor = [UIColor lightGrayColor];
        desc.text = self.rDesc;
	}
	return _headerView;
}
#pragma mark - dataTask
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.contentVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.contentVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.contentVM.dataTask cancel];
}
@end
