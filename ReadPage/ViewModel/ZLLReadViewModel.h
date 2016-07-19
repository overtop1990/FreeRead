//
//  ZLLReadViewModel.h
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZLLNetManager.h"

@interface ZLLReadViewModel : TRBaseViewModel

/** <# #>  */
@property (nonatomic) NSInteger page;
/** <# #>  */
@property (nonatomic) NSString *pageID;
/** <# #>  */
@property (nonatomic) NSString *createTime;
/** <# #>  */
@property (nonatomic) NSMutableArray<ZLLReadDatasModel *> *dataList;
/** <# #>  */
@property (nonatomic) BOOL hasMore;
/** <# #>  */
@property (nonatomic) NSInteger numberOfRow;

- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)titleForRow: (NSInteger)row;
- (NSString *)authorForRow: (NSInteger)row;
- (NSURL *)html5ForRow: (NSInteger)row;

@end
