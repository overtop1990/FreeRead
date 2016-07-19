//
//  AppDelegate.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLLNewsViewController.h"
#import "ZLLYearViewController.h"
#import "ZLLReadNewViewController.h"
#import "ZLLSettingTableViewController.h"
#import "ZLLNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    self.window.rootViewController = self.tabC;
    //推送必须征求用户的同意: iOS8之前和之后有区别
    //@"9,3,2" ->9.32
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (systemVersion >= 8.0) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
    }else {
        //图片上的数字, 弹出提示, 声音提示
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];
    }
    return YES;
}
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}
- (UITabBarController *)tabC{
    if (!_tabC) {
        _tabC = [UITabBarController new];
        ZLLYearViewController *yearVC = [ZLLYearViewController new];
        UINavigationController *naviYearVC = [[UINavigationController alloc] initWithRootViewController:yearVC];
        ZLLNewsViewController *newsVC = [ZLLNewsViewController new];
        UINavigationController *naviNewsVC = [[UINavigationController alloc] initWithRootViewController:newsVC];
        ZLLReadNewViewController *rNewVC = [ZLLReadNewViewController new];
        UINavigationController *naviReadVC = [[UINavigationController alloc] initWithRootViewController:rNewVC];
        ZLLSettingTableViewController *stVC = [ZLLSettingTableViewController new];
        UINavigationController *naviMyVC = [[UINavigationController alloc] initWithRootViewController:stVC];
        _tabC.viewControllers = @[naviReadVC, naviYearVC, naviNewsVC, naviMyVC];
        naviMyVC.tabBarItem.title = @"我的";
        naviMyVC.tabBarItem.image = [UIImage imageNamed:@"tab_profile"];
        naviMyVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_profile_on"];
        naviReadVC.tabBarItem.title = @"推荐";
        naviReadVC.tabBarItem.image = [UIImage imageNamed:@"tab_recommend_default"];
        naviReadVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_recommend_select"];
        naviYearVC.tabBarItem.title = @"故事";
        naviYearVC.tabBarItem.image = [UIImage imageNamed:@"tab_story_default"];
        naviYearVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_story_select"];
        naviNewsVC.tabBarItem.title = @"图文";
        naviNewsVC.tabBarItem.image = [UIImage imageNamed:@"tab_find_default"];
        naviNewsVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_find_select"];
        [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        [UINavigationBar appearance].translucent = NO;
        [UINavigationBar appearance].barTintColor = kRGBColor(251, 141, 41, 1.0);
        
        [UITabBar appearance].translucent = NO;
        [UITabBar appearance].backgroundColor = kRGBColor(240, 239, 237, 1.0);
        _window.tintColor = [UIColor redColor];
        [NSThread sleepForTimeInterval:1];
    }
    return _tabC;
}

@end
