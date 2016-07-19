//
//  ZLLContentCell.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLContentCell.h"

@implementation ZLLContentCell
- (UIImageView *)iconIV{
    if (_iconIV == nil) {
        _iconIV = [UIImageView new];
        CGFloat width = self.contentView.bounds.size.height * 400 / 280.0;
        [self.contentView addSubview: _iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(8);
            make.bottom.equalTo(-8);
            make.width.equalTo(width);
        }];
        _iconIV.clipsToBounds = YES;
        _iconIV.layer.cornerRadius = 5;
        
    }
    return _iconIV;
}

- (UILabel *)title{
    if (_title == nil) {
        _title = [UILabel new];
        [self.contentView addSubview: _title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.right.equalTo(-8);
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
        }];
        _title.font = [UIFont systemFontOfSize:16];
        
    }
    return _title;
}

- (UILabel *)desc{
    if (_desc == nil) {
        _desc = [UILabel new];
        [self.contentView addSubview: _desc];
        [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.top.equalTo(self.title.mas_bottom).equalTo(8);
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
        }];
        _desc.textColor = [UIColor lightGrayColor];
        _desc.font = [UIFont systemFontOfSize:14];
        _desc.numberOfLines = 2;
        
    }
    return _desc;
}

- (UILabel *)readtime{
    if (_readtime == nil) {
        _readtime = [UILabel new];
        [self.contentView addSubview: _readtime];
        [_readtime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-8);
            make.left.equalTo(self.iconIV.mas_right).equalTo(5);
        }];
        _readtime.font =[UIFont systemFontOfSize:12];
        
    }
    return _readtime;
}

@end
