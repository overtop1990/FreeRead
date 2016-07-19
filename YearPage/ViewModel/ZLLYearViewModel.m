//
//  ZLLYearViewModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/6.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLYearViewModel.h"

@implementation ZLLYearViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
        [_dataHotList removeAllObjects];
    }
    [ZLLNetManager postYearDataWithPage:tmpPage CompletionHandler:^(id model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.dataList removeAllObjects];
            [self.dataHotList removeAllObjects];
            
        }
        _yearModel = model;
        [_dataHotList addObjectsFromArray:_yearModel.readHots.sets];
        [_dataList addObjectsFromArray:_yearModel.readOthers];
        _page = tmpPage;
        _hasMore = _dataList.count != 0;
        !completionHandler ?: completionHandler(error);
    }];
}
//热门
- (NSInteger)rowHotNumber{
    return self.dataHotList.count;
}
- (NSURL *)iconHeadIVForRow:(NSInteger)row{
    return self.dataHotList[row].rJpg.yx_URL;
}
- (NSInteger)rIdHeadForRow:(NSInteger)row{
    return self.dataHotList[row].rId;
}
- (NSString *)titleHeadForRow:(NSInteger)row{
    return self.dataHotList[row].rTitle;
}
//普通
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.dataList[row].rJpg.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].rTitle;
}
- (NSInteger)rIdForRow:(NSInteger)row{
    return self.dataList[row].rId;
}
- (NSString *)rDescForRow:(NSInteger)row{
    return self.dataList[row].rDesc;
}
- (NSString *)rTitleForRow:(NSInteger)row{
    return self.dataList[row].rTitle;
}
- (NSMutableArray<ZLLYearOthersModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (NSMutableArray<ZLLYearHotsSetsModel *> *)dataHotList{
    if (!_dataHotList) {
        _dataHotList = [NSMutableArray array];
        
    }
    return _dataHotList;
}

@end
