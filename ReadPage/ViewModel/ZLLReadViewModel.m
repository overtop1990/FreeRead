//
//  ZLLReadViewModel.m
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZLLReadViewModel.h"

@implementation ZLLReadViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    NSString *tmpPageID = @"";
    NSString *tmpCreatTime = @"";
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
        tmpPageID = _pageID;
        tmpCreatTime = _createTime;
    }
    [ZLLNetManager getDataWithPage:tmpPage withPageID:tmpPageID withCreateTime:tmpCreatTime CompletionHandler:^(ZLLReadModel *model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.dataList removeAllObjects];
        }
        [_dataList addObjectsFromArray: model.datas];

        _page  =  tmpPage;
        _createTime = self.dataList.lastObject.createTime;
        _pageID = self.dataList.lastObject.ID;
        _hasMore = model.datas.count == 30;
        !completionHandler ?: completionHandler (error);
        
    }];
    
}

- (NSInteger)numberOfRow{
    return self.dataList.count;
}

- (NSURL *)iconIVForRow:(NSInteger)row{
    
    return self.dataList[row].thumbnail.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{

    return self.dataList[row].title;
}
- (NSString *)authorForRow:(NSInteger)row{
    return self.dataList[row].author;
}
- (NSMutableArray<ZLLReadDatasModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
        
    }
    return _dataList;
}
- (NSURL *)html5ForRow:(NSInteger)row{
    return self.dataList[row].html5.yx_URL;
}
@end
