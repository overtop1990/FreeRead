//
//  ZLLDetailsViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearDetailsViewController.h"

@interface ZLLYearDetailsViewController ()<UIWebViewDelegate>
/**   */
@property (nonatomic) UIImageView *imageView;
/**   */
@property (nonatomic) UILabel *titleLabel;
/** 作者图像 */
@property (nonatomic) UIImageView *iconView;
/** <# #>  */
@property (nonatomic) UILabel *nameLabel;
/** <# #>  */
@property (nonatomic) UILabel *descLable;
/** <# #>  */
@property (nonatomic) UIWebView *webView;

@end

@implementation ZLLYearDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self webView];
    [self imageView];
    [self titleLabel];
    [self iconView];
    [self nameLabel];
    [self descLable];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:self action:@selector(didClickedBtn:)];
    [rightBtn setImage:[UIImage imageNamed:@"catalog_collect"]];
    self.navigationItem.rightBarButtonItem = rightBtn ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//开始加载网络请求时
- (void)webViewDidStartLoad:(UIWebView *)webView;{
    //在状态栏出现一个转圈的提示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error;{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)didClickedBtn: (id)sender{
    
    
}

#pragma mark - lazyLoad 懒加载

- (UIImageView *)imageView {
    if(_imageView == nil) {
        
        CGFloat height = kScreenW * 280 / 400;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -(kScreenW * 280 / 400 + 48 + 23 + 28 + 16), kScreenW, height)];
        [self.webView.scrollView addSubview: _imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 5;
        [_imageView sd_setImageWithURL:self.imageURL];
        
    }
    return _imageView;
}



- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW - 50, kScreenW * 280 / 400 + 3, kScreenW, 20)];
        [self.webView.scrollView addSubview: _titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).equalTo(3);
            make.centerX.equalTo(0);
        }];
        _titleLabel.text = self.title;
        _titleLabel.font = [UIFont systemFontOfSize:20];
        
    }
    return _titleLabel;
}

- (UIImageView *)iconView {
    if(_iconView == nil) {
        CGFloat w = kScreenW/2 - 80;
        _iconView = [[UIImageView alloc] init];
        [self.view addSubview: _iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(w);
            make.top.equalTo(self.titleLabel.mas_bottom).equalTo(3);
            make.height.equalTo(45);
            make.width.equalTo(45);
        }];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 45 / 2.0;
        [_iconView sd_setImageWithURL:self.iconURL];
        
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if(_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        [self.view addSubview: _nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconView.mas_right).equalTo(15);
            make.centerY.equalTo(self.iconView);
        }];
        _nameLabel.text = [NSString stringWithFormat:@"作者:  %@", self.name];
        _nameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nameLabel;
}

- (UILabel *)descLable {
    if(_descLable == nil) {
        _descLable = [[UILabel alloc] init];
        [self.view addSubview:_descLable];
        [_descLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(self.iconView.mas_bottom).equalTo(12);
        }];
        _descLable.textAlignment = NSTextAlignmentCenter;
        _descLable.numberOfLines = 2;
        _descLable.textColor = [UIColor lightGrayColor];
        _descLable.font = [UIFont systemFontOfSize:16];
        _descLable.text = self.desc;
    }
    return _descLable;
}

- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        [self.webView loadData:[NSData dataWithContentsOfURL:self.textURL] MIMEType:@"text/html/jpg" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.textURL]]];
        CGFloat h = kScreenW * 280 / 400 + 48 + 23 + 28 + 16;
        self.webView.scrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview: _webView];
        self.webView.scrollView.contentInset = UIEdgeInsetsMake(h, 0, 0, 0);
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(0);
        }];
        _webView.delegate = self;

    }
    return _webView;
}

@end
