//
//  ZLLContentViewModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZLLNetManager.h"

@interface ZLLContentViewModel : TRBaseViewModel
- (instancetype)initWithRID: (NSInteger)rID;
/** <# #>  */
@property (nonatomic,readonly) NSInteger rID;
/** <# #>  */
@property (nonatomic) NSInteger page;
/** <# #>  */
@property (nonatomic,strong) NSMutableArray<ZLLContentContentsModel *> *dataList;
/** <# #>  */
@property (nonatomic) BOOL hasMore;
/** <# #>  */
@property (nonatomic) NSInteger rowNumber;

- (NSString *)descForRow: (NSInteger)row;
- (NSString *)titleForRow: (NSInteger)row;
- (NSInteger)readtimeForRow: (NSInteger)row;
- (NSURL *)iconIVForRow: (NSInteger)row;
- (NSURL *)iconForROW: (NSInteger)row;
- (NSURL *)textURLForRow: (NSInteger)row;
- (NSString *)nameForRow: (NSInteger)row;

@end
