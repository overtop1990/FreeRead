//
//  ZLLDetailsViewController.m
//  TRProject
//
//  Created by 朱乐乐 on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZLLDetailsViewController.h"

@interface ZLLDetailsViewController ()<UIWebViewDelegate>
/** webView  */
@property (nonatomic,strong) UIWebView *webView;

@end

@implementation ZLLDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webView];
    self.navigationItem.title = @"文章";
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStyleDone target:self action:@selector(didClickedBtn:)];
    [rightBtn setImage:[UIImage imageNamed:@"catalog_collect"]];
    self.navigationItem.rightBarButtonItem = rightBtn ;
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
    NSString *str = @"document.getElementsByClassName('goapp')[0].remove()";
    [self.webView stringByEvaluatingJavaScriptFromString:str];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('commentMore')[0].remove()"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('commentsWrap')[0].remove()"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('bCon favCon')[0].remove()"];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error;{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)didClickedBtn: (id)sender{
    NSLog(@"已收藏");
    
}
- (UIWebView *)webView {
	if(_webView == nil) {
		_webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_webView loadRequest: [NSURLRequest requestWithURL:_webURL]];
//        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
	}
	return _webView;
}


@end
