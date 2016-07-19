//
//  ZLLMyPageViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/11.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLMyPageViewController.h"
#import "ZLLSettingTableViewController.h"

static NSString *const storyBoardID = @"ZLLMyPageViewController";
@interface ZLLMyPageViewController ()
//账号
@property (weak, nonatomic) IBOutlet UITextField *name;
//密码
@property (weak, nonatomic) IBOutlet UITextField *password;
@end

@implementation ZLLMyPageViewController

#pragma mark - lifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的";
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        self = [storyBoard instantiateViewControllerWithIdentifier:storyBoardID];
    }
    return self;
}

#pragma mark - Methods 方法
//打开收藏页面
- (IBAction)gotoStorePage:(UIButton *)sender {
    
}

//打开设置页面
- (IBAction)gotoSetingPage:(UIButton *)sender {
    [self.navigationController pushViewController:[ZLLSettingTableViewController new] animated:YES];
    
}

//登录按钮
- (IBAction)clickTheBtnForLogin:(UIButton *)sender {
    NSLog(@"登录");
}
//注册按钮
- (IBAction)clickTheBtnForRegister:(UIButton *)sender {
    NSLog(@"注册");
}
//忘记密码
- (IBAction)clickTheBtnForForgetThePassword:(UIButton *)sender {
    NSLog(@"忘记密码");
}
//快速登录微信
- (IBAction)clickTheBtnForFastLoginWechat:(UIButton *)sender {
    NSLog(@"快速登录微信");
}
//快速登录微博
- (IBAction)clickTheBtnForFastLoginWeibo:(UIButton *)sender {
    NSLog(@"快速登录微博");
}
//快速登录QQ
- (IBAction)clickTheBtnForFastLoginQQ:(UIButton *)sender {
    NSLog(@"快速登录QQ");
}

@end
