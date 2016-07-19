//
//  ZLLNetManager.m
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZLLNetManager.h"

@implementation ZLLNetManager
//单读
+ (id)getDataWithPage:(NSInteger)page withPageID:(NSString *)ID withCreateTime: (NSString *)createTime CompletionHandler:(void (^)(ZLLReadModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kReadPath,page,ID,createTime];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler ([ZLLReadModel parseJSON:jsonObject], error);
    }];
    
}
//果壳
+ (id)getDataWithDatePicked:(NSString *)datePicked CompletionHandler:(void (^)(ZLLNewsModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kNewsPath, datePicked];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler ([ZLLNewsModel parseJSON:jsonObject], error);
    }];
}
//那年
+ (id)postYearDataWithPage:(NSInteger)page CompletionHandler:(void (^)(id , NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kYearPath, page];
    return [self POST:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZLLYearModel parseJSON:jsonObject], error);
    }];
}
//那年内容
+ (id)postContentDataWithPage:(NSInteger)page andRID:(NSInteger)rID CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kYearContentPath,rID,page];
    return [self POST:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZLLContentModel parseJSON:jsonObject], error);
    }];
    
    
    
}
@end
