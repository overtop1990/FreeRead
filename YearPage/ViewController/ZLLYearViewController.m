//
//  ZLLYearViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearViewController.h"
#import "ZLLYearCell.h"
#import "ZLLHotReusableView.h"
#import "ZLLYearViewModel.h"
#import "ZLLYearContentViewController.h"

@interface ZLLYearViewController ()
/** <# #>  */
@property (nonatomic) ZLLYearViewModel *yearVM;
@end

@implementation ZLLYearViewController

static NSString *const recommendHeaderIdentify = @"RecommendHeader";
static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerReferenceSize = CGSizeMake(kScreenW, 200);
    CGFloat width = (kScreenW - 30)/2.0;
    CGFloat height = width * 280 / 400.0;
    layout.itemSize = CGSizeMake(width, height);
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
       self.navigationItem.title = @"故事专辑";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[ZLLYearCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[ZLLHotReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderIdentify];
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.yearVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
            if (weakSelf.yearVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.yearVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            if (weakSelf.yearVM.hasMore) {
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
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.yearVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    ZLLYearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[self.yearVM iconIVForRow:indexPath.row]];
        cell.title.text = [self.yearVM titleForRow:indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *ruView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        ZLLHotReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderIdentify forIndexPath:indexPath];
        [headerView getDataFormModel:self.yearVM.dataHotList CompletionHandler:^{
            [headerView.ic reloadData];
        }];
        ruView = headerView;
    }
    return ruView;
}
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(kScreenW, kScreenW *0.7);
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ZLLYearContentViewController *yearContentVC = [ZLLYearContentViewController new];
    yearContentVC.rID = [self.yearVM rIdForRow:indexPath.row];
    yearContentVC.rDesc = [self.yearVM rDescForRow:indexPath.row];
    yearContentVC.rTitle = [self.yearVM rTitleForRow:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:yearContentVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - lazyLoad 懒加载
- (ZLLYearViewModel *)yearVM {
	if(_yearVM == nil) {
		_yearVM = [[ZLLYearViewModel alloc] init];
	}
	return _yearVM;
}
#pragma mark - dataTask
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.yearVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.yearVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.yearVM.dataTask cancel];
}
@end
