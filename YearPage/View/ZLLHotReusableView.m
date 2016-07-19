//
//  ZLLHotReusableView.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLHotReusableView.h"
#import "ZLLYearContentViewController.h"

@interface ZLLHotReusableView ()<iCarouselDelegate, iCarouselDataSource>
/** <# #>  */
@property (nonatomic,readonly) NSArray<ZLLYearHotsSetsModel *> *model;
/** <# #>  */
@property (nonatomic, strong) UIPageControl *pc;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZLLHotReusableView

#pragma mark - lifeCycle 生命周期
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self ic];
  
      
        
    }
    return self;
}

#pragma mark - lazyLoad 懒加载


- (iCarousel *)ic {
	if(_ic == nil) {
         CGFloat height = kScreenW *0.7;
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, height)];
        _ic.dataSource = self;
        _ic.delegate = self;
        _ic.scrollSpeed = .2;
        [self addSubview: _ic];
       
        
        _pc = [UIPageControl new];
        _pc.numberOfPages = 6;
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(4);
            make.right.equalTo(-3);
        }];
//        _pc.backgroundColor = [UIColor redColor];
//        _pc.tintColor = [UIColor redColor];
        
        [_timer invalidate];
        _timer = nil;
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
	}
	return _ic;
}


#pragma mark - iC
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.model.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        [view addSubview: iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.tag = 100;
        iv.clipsToBounds = YES;
        UIView *viewBack = [UIView new];
        [view addSubview:viewBack];
        [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        viewBack.backgroundColor = kRGBColor(0, 0, 0, 0.6);
        UILabel *label = [UILabel new];
        label.tag = 101;
        [viewBack addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.centerY.equalTo(0);
        }];
        label.textColor = [UIColor whiteColor];

    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:self.model[index].rJpg.yx_URL];
    UILabel *label = (UILabel *)[view viewWithTag:101];
    label.text = self.model[index].rTitle;
    return view;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    ZLLYearContentViewController *yearContentVC = [ZLLYearContentViewController new];
    yearContentVC.rID = self.model[index].rId;
    yearContentVC.rTitle = self.model[index].rTitle;
    yearContentVC.rDesc = self.model[index].rDesc;
    [self.viewController.navigationController pushViewController:yearContentVC animated:YES];
    
}
- (void)getDataFormModel:(NSMutableArray<ZLLYearHotsSetsModel *> *)model CompletionHandler:(void (^)())completionHandler{
    _model = [NSArray arrayWithArray:model];
    !completionHandler ?: completionHandler();
}

@end
