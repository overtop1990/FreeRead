//
//  ZLLReadCell.m
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZLLReadCell.h"

@interface ZLLReadCell ()
/** <# #>  */
@property (nonatomic,strong) UIView *corverView;

@end

@implementation ZLLReadCell
/** 重写初始化方法 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
    }
    return self;
}

-(void)initView{
    
    self.clipsToBounds = YES;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 280)];
    imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UIView *corverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 280)];
    corverView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    corverView.backgroundColor = [UIColor blackColor];
   
    
    self.title = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.title.font = [UIFont systemFontOfSize:20];
    [self.imageView addSubview: self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-130);
    }];
    self.title.numberOfLines = 2;
    self.title.textColor = [UIColor whiteColor];
    
    
    self.name = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.name.font = [UIFont systemFontOfSize:12];
    self.name.textColor = [UIColor whiteColor];
    [self.imageView addSubview: self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-95);
        
    }];
    
    self.corverView = corverView;
    [self addSubview:corverView];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    self.imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    //标准高度
    CGFloat standardCellHeight = 100.0;
    //特殊高度
    CGFloat featureCellHeight = 280.0;
    //是挪动的图片高度 占  需要完全显示第二张图片的挪动高度  的比例
    CGFloat delta = 1 - ((featureCellHeight - CGRectGetHeight(self.frame)) / (featureCellHeight - standardCellHeight));
    
    CGFloat minAlpha = 0;
    CGFloat maxAlpha = 0.5;
    
    self.corverView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    self.corverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha));
}


@end
