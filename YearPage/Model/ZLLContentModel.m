//
//  ZLLContentModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLContentModel.h"

@implementation ZLLContentModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"contents": [ZLLContentContentsModel class]};
}
@end
@implementation ZLLContentSetModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"rId": @"r_id",
             @"rDesc": @"r_desc",
             @"rTitle": @"r_title",
             @"rSize": @"r_size",
             @"rImage": @"r_image",
             @"rType": @"r_type",
             @"rWord": @"r_word",
             @"rCollectsize": @"r_collectsize",
             @"rJpg": @"r_jpg",
             @"rIscollect": @"r_iscollect"};
}
@end


@implementation ZLLContentContentsModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"cId": @"c_id",
             @"cDesc": @"c_desc",
             @"cTitle": @"c_title",
             @"wordCollotTotle": @"word_collotTotle",
             @"cInfoUrl": @"c_info_url",
             @"cState": @"c_state",
             @"recommendState": @"recommend_state",
             @"cJpg": @"c_jpg",
             @"returnState": @"return_state",
             @"cShow": @"c_show",
             @"cType": @"c_type",
             @"cUpdate": @"c_update"};
}
@end


@implementation ZLLContentContentsCatergoryModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id",
             @"cName": @"c_name"};
}
@end


@implementation ZLLContentContentsAuthorModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"uName": @"u_name",
             @"uSign": @"u_sign",
             @"uIcon": @"u_icon",
             @"uSex": @"u_sex",
             @"uId": @"u_id"};
}
@end


