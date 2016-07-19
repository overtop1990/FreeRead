//
//  ZLLNetManager.h
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLLReadModel.h"
#import "ZLLNewsModel.h"
#import "ZLLYearModel.h"
#import "ZLLContentModel.h"

@interface ZLLNetManager : NSObject

+ (id)getDataWithPage: (NSInteger)page withPageID: (NSString *)ID withCreateTime: (NSString *)createTime CompletionHandler: (void(^)(ZLLReadModel *model, NSError *error))completionHandler;

+ (id)getDataWithDatePicked: (NSString *)datePicked CompletionHandler: (void(^)(ZLLNewsModel *model, NSError *error))completionHandler;

+ (id)postYearDataWithPage: (NSInteger)page CompletionHandler: (void(^)(id model, NSError *error))completionHandler;

+ (id)postContentDataWithPage: (NSInteger)page andRID: (NSInteger)rID CompletionHandler: (void(^)(id model, NSError *error))completionHandler;

@end
