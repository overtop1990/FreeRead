//
//  ZLLYearCell.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearCell.h"

@implementation ZLLYearCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageView];
        [self title];
        
    }
    return self;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        [self.contentView addSubview: _imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(self.title.mas_top);
        }];
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 5;
    
    }
    return _imageView;
    
}
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview: _title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.equalTo(0);
            make.height.equalTo(20);
        }];
        _title.font = [UIFont systemFontOfSize:20];
    }
    return _title;
}
@end
