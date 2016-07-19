//
//  ZLLNewsModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLNewsModel.h"

@implementation ZLLNewsModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"result": [ZLLNewsResultModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"NewsOK": @"ok"};
}
@end
@implementation ZLLNewsResultModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"videoUrl": @"video_url",
             @"repliesCount": @"replies_count",
             @"dateCreated": @"date_created",
             @"datePicked": @"date_picked",
             @"sourceData": @"source_data",
             @"sourceName": @"source_name",
             @"isTop": @"is_top",
             @"ID": @"id",
             @"headlineImg": @"headline_img",
             @"linkV2SyncImg": @"link_v2_sync_img",
             @"headlineImgTb": @"headline_img_tb",
             @"linkV2": @"link_v2",
             @"pageSource": @"page_source",
             @"replyRootId": @"reply_root_id",};
}
@end

@implementation ZLLNewsResultSourceDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


