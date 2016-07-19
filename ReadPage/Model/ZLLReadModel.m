//
//  ZLLReadModel.m
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZLLReadModel.h"

@implementation ZLLReadModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"datas": [ZLLReadDatasModel class]};
}

@end


@implementation ZLLReadDatasModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"tags" : [ZLLReadDatasTagsModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"createTime": @"create_time",
             @"showUid": @"show_uid",
             @"hotcomments": @"hot_comments",
             @"publishTime": @"publish_time",
             @"fmPlay": @"fm_play",
             @"ID": @"id",
             @"linkUrl": @"link_url",
             @"updateTime": @"update_time",};
}
@end


@implementation ZLLReadDatasTagsModel

@end


