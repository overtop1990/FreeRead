//
//  ZLLContentViewModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLContentViewModel.h"

@implementation ZLLContentViewModel
- (instancetype)init
{
    NSAssert1(NO, @"必须使用(instancetype)initWithRID:初始化 %s", __FUNCTION__);
    return nil;
}
- (instancetype)initWithRID:(NSInteger)rID{
    self = [super init];
    if (self) {
        _rID = rID;
    }
    return self;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    [ZLLNetManager postContentDataWithPage:tmpPage andRID:self.rID CompletionHandler:^(id model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.dataList removeAllObjects];
        }
        ZLLContentModel *contentModel = model;
        [self.dataList addObjectsFromArray:contentModel.contents];
        _page = tmpPage;
        _hasMore = contentModel.contents.count == 10;
        !completionHandler ?: completionHandler(error);
    }];
}
#pragma mark - lazyLoad 懒加载
- (NSMutableArray<ZLLContentContentsModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


#pragma mark - Methods 方法
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.dataList[row].cJpg.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].cTitle;
}
- (NSInteger)readtimeForRow:(NSInteger)row{
    return self.dataList[row].readtime;
}
- (NSString *)descForRow:(NSInteger)row{
    return self.dataList[row].cDesc;
}
- (NSURL *)iconForROW:(NSInteger)row{
    return self.dataList[row].author.uIcon.yx_URL;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.dataList[row].author.uName;
}
- (NSURL *)textURLForRow:(NSInteger)row{
    return self.dataList[row].cInfoUrl.yx_URL;
}
@end
