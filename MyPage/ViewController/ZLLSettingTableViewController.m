//
//  ZLLSettingTableViewController.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/11.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLSettingTableViewController.h"

static NSString *const storyBoardID = @"ZLLSettingTableViewController";
@interface ZLLSettingTableViewController ()
//是否接收推送
@property (weak, nonatomic) IBOutlet UILabel *isReserveMessager;
//缓存
@property (weak, nonatomic) IBOutlet UILabel *cacheCount;
@end

@implementation ZLLSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = kRGBColor(252, 247, 245, 1.0);
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tableView.scrollEnabled = NO;
    [[NSOperationQueue new]addOperationWithBlock:^{
        _cacheCount.text = [self getCacheSize];
    }];
    self.navigationItem.title = @"设置";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:@"back_white".yx_image style:UIBarButtonItemStyleDone target:self action:@selector(clickTheBtnBackToLastPage:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == 0) {
        _isReserveMessager.text = @"已关闭";
    }else {
        _isReserveMessager.text = @"已开启";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化方式
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        self = [storyBoard instantiateViewControllerWithIdentifier:storyBoardID];
    }
    return self;
}
#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!indexPath.section) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"缓存清除" message:@"确定清除缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        alertView.delegate = self;
        [alertView show];
    }
}
#pragma mark - Method
//计算缓存大小
- (NSString *)getCacheSize
{
    long long sumSize = 0;
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSArray *subPaths = [filemanager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
    for (NSString *subPath in subPaths) {
        NSString *filePath = [cacheFilePath stringByAppendingPathComponent:subPath];
        long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
        sumSize += fileSize;
    }
    float size_m = sumSize/(1000*1000);
    return [NSString stringWithFormat:@"%.2fM",size_m];
}
//返回上一页
- (void)clickTheBtnBackToLastPage:sender{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[NSOperationQueue new]addOperationWithBlock:^{
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
            [fileManager removeItemAtPath:cacheFilePath error:nil];
            _cacheCount.text = [self getCacheSize];
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }];
    }
}
#pragma mark - 页面跳转
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSOperationQueue new]addOperationWithBlock:^{
        _cacheCount.text = [self getCacheSize];
    }];
    [self.tableView reloadData];
}

@end
