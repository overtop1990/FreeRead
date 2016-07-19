//
//  ZLLNewsViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLNewsViewController.h"
#import "ZLLNewsDetailsController.h"
#import "ZLLNewsViewModel.h"

@interface ZLLNewsViewController ()<PSCollectionViewDelegate, PSCollectionViewDataSource>
/** <# #>  */
@property (nonatomic) PSCollectionView *collectionView;
/** <# #>  */
@property (nonatomic) ZLLNewsViewModel *newsVM;
@end

@implementation ZLLNewsViewController
#pragma mark - PSCollectionViewDataSource
- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    ZLLNewsDetailsController *detailsC = [ZLLNewsDetailsController new];
    detailsC.webURL = [self.newsVM html5ForRow:index];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.newsVM.numberOfRow;

}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [PSCollectionViewCell new];
//        UILabel *label = [UILabel new];
//        label.font = [UIFont systemFontOfSize:14];
//        [cell addSubview: label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.left.right.equalTo(0);
//            make.height.equalTo(15);
//        }];
//        label.tag = 200;
        UIImageView *iconIV = [UIImageView new];
        [cell addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
//            make.bottom.equalTo(label.mas_top).equalTo(0);
        }];
        iconIV.tag = 100;
       
//        label.textColor = [UIColor whiteColor];
//        [iconIV addSubview:label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(0);
//            make.bottom.equalTo(-20);
//            make.height.equalTo(14);
//        }];
        
    }
    UIImageView *iconIV = (UIImageView *)[cell viewWithTag:100];
//    UILabel *title = (UILabel *)[cell viewWithTag:200];
//    
//    title.text = [self.newsVM titleForRow:index];
    [iconIV sd_setImageWithURL:[self.newsVM iconIVForRow:index]];
    return cell;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 5 * 8)/2;
    return width * [self.newsVM hwScaleForRow:index] + 20;
   
}

#pragma mark - lifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图文精选";
    [self.newsVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
        [self.collectionView reloadData];
        [self.collectionView beginHeaderRefresh];
        [self.collectionView endHeaderRefresh];
    }];
    
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.newsVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error);
                return;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
            if (weakSelf.newsVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.newsVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            if (weakSelf.newsVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.collectionView beginHeaderRefresh];
        [self.collectionView endHeaderRefresh];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView beginHeaderRefresh];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - lazyLoad 懒加载
- (ZLLNewsViewModel *)newsVM {
	if(_newsVM == nil) {
		_newsVM = [[ZLLNewsViewModel alloc] init];
	}
	return _newsVM;
}

- (PSCollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[PSCollectionView alloc] init];
        [self.view addSubview: _collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        _collectionView.numColsPortrait = 2;
	}
	return _collectionView;
}
#pragma mark - dataTask
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.newsVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.newsVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.newsVM.dataTask cancel];
}
@end
