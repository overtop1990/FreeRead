//
//  ZLLYearModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/6.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearModel.h"

@implementation ZLLYearModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"readOthers": [ZLLYearOthersModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"readOthers": @"read_others",
             @"readHots": @"read_hots"};
}

@end
@implementation ZLLYearHotsModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"sets":[ZLLYearHotsSetsModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"slId": @"sl_id",
             @"slDesc": @"sl_desc"};
}

@end


@implementation ZLLYearHotsSetsModel
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


@implementation ZLLYearOthersModel
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


