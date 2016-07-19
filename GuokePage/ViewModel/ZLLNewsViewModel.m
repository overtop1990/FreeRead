//
//  ZLLNewsViewModel.m
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLNewsViewModel.h"

@implementation ZLLNewsViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
//    NSDate *datenow = [NSDate date];
//    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
//    
//    NSString *tmpStr = @([timeSp integerValue] + 1).stringValue;
    NSString *tmpStr = @"";
    if (requestMode ==VMRequestModeMore) {
        tmpStr = @(self.dataList.lastObject.datePicked - 1).stringValue;
    }
    [ZLLNetManager getDataWithDatePicked:tmpStr CompletionHandler:^(ZLLNewsModel *model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.dataList removeAllObjects];
        }
            [_dataList addObjectsFromArray:model.result];
        _hasMore = model.result.count == 20;
        !completionHandler ?: completionHandler(error);
    }];
    
}
- (double)hwScaleForRow:(NSInteger)row{
    UIImageView *iv = [UIImageView new];
    [iv sd_setImageWithURL:self.dataList[row].headlineImg.yx_URL];
    return iv.image.size.height / (double)iv.image.size.width;
}
- (NSInteger)numberOfRow{
    return self.dataList.count;
}

- (NSURL *)iconIVForRow:(NSInteger)row{
    
    return self.dataList[row].headlineImg.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{

    return self.dataList[row].title;
}

- (NSMutableArray<ZLLNewsResultModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
        
    }
    return _dataList;
}
- (NSURL *)html5ForRow:(NSInteger)row{
    return self.dataList[row].link.yx_URL;
}
@end
