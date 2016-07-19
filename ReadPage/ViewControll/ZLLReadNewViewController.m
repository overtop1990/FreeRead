//
//  ZLLReadNewViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/11.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLReadNewViewController.h"
#import "ZLLReadCell.h"
#import "ZLLReadViewModel.h"
#import "ZLLCustromLayout.h"
#import "ZLLDetailsViewController.h"

static NSString *const readIdentify = @"readCell";
@interface ZLLReadNewViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
/** collectionView  */
@property (nonatomic) UICollectionView *collectionView;
/** 回到顶部 */
@property (nonatomic, strong) UIControl *upToTop;
/** <# #>  */
@property (nonatomic) ZLLReadViewModel *readVM;
@end


@implementation ZLLReadNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    [self upToTop];
    self.navigationItem.title = @"推荐";
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.readVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error);
                return;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
            if (weakSelf.readVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.readVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            if (weakSelf.readVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.readVM.numberOfRow;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLLReadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:readIdentify forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[self.readVM iconIVForRow:indexPath.row]];
    cell.title.text = [self.readVM titleForRow:indexPath.row];
    cell.name.text = [self.readVM authorForRow:indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ZLLDetailsViewController *detailsVC = [ZLLDetailsViewController new];
    detailsVC.webURL = [self.readVM html5ForRow:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}

#pragma mark - Methods 方法
//回到顶部
- (void)clickItWillToTop:sender{
    [self.collectionView scrollToTop];
}

#pragma mark - lazyLoad 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
        ZLLCustromLayout *layout = [[ZLLCustromLayout alloc] init] ;
        layout.standardCellHeight = 100.0;
        layout.featureCellHeight = 280.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:layout];
        [self.view addSubview: _collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZLLReadCell class] forCellWithReuseIdentifier:readIdentify];
        self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
	}
	return _collectionView;
}
- (UIControl *)upToTop {
    if(_upToTop == nil) {
        _upToTop = [[UIControl alloc] init];
        [self.view addSubview:_upToTop];
        [_upToTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.bottom.equalTo(-160);
            make.width.height.equalTo(45);
        }];
        _upToTop.layer.cornerRadius = 45/2.0;
        UIImageView *image = @"upupup".yx_imageView;
        [_upToTop addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_upToTop addTarget:self action:@selector(clickItWillToTop:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upToTop;
}
- (ZLLReadViewModel *)readVM {
    if(_readVM == nil) {
        _readVM = [[ZLLReadViewModel alloc] init];
    }
    return _readVM;
}
#pragma mark - dataTask
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.readVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.readVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.readVM.dataTask cancel];
}
@end
