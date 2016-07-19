//
//  ZLLYearDetailsViewController.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLLYearDetailsViewController : UIViewController
/** 大图片  */
@property (nonatomic) NSURL *imageURL;
/** 标题  */
@property (nonatomic) UILabel *dTitle;
/** 小图片  */
@property (nonatomic) NSURL *iconURL;
/** 作者名字  */
@property (nonatomic) NSString *name;
/** 描述  */
@property (nonatomic) NSString *desc;
/** 文档链接  */
@property (nonatomic) NSURL *textURL;
@end
