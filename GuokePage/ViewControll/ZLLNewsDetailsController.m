//
//  ZLLNewsDetailsController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLNewsDetailsController.h"

@interface ZLLNewsDetailsController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ZLLNewsDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:self action:@selector(didClickedBtn:)];
    [rightBtn setImage:[UIImage imageNamed:@"catalog_collect"]];
    self.navigationItem.rightBarButtonItem = rightBtn ;
    
    [self webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//开始加载网络请求时
- (void)webViewDidStartLoad:(UIWebView *)webView;{
    //在状态栏出现一个转圈的提示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;{
    //删除html5中的某个标签
        [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('down')[0].remove()"];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error;{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

#pragma mark - Methods 方法
- (void)didClickedBtn: (id)sender{
    NSLog(@"已收藏");
    
}

#pragma mark - lazyLoad 懒加载
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        [_webView loadRequest: [NSURLRequest requestWithURL:_webURL]];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _webView.delegate = self;
    }
    return _webView;
}

@end
