//
//  ZLLYearViewModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/6.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZLLNetManager.h"

@interface ZLLYearViewModel : TRBaseViewModel
/** <# #>  */
@property (nonatomic) NSInteger page;
/** 9  */
@property (nonatomic) NSMutableArray<ZLLYearOthersModel *> *dataList;
/** <# #>  */
@property (nonatomic) ZLLYearModel *yearModel;
/** <# #>  */
@property (nonatomic) BOOL hasMore;
/** <# #>  */
@property (nonatomic) NSInteger rowNumber;
- (NSURL *)iconIVForRow: (NSInteger)row;
- (NSString *)titleForRow: (NSInteger)row;
- (NSInteger)rIdForRow: (NSInteger)row;
- (NSString *)rDescForRow: (NSInteger)row;
- (NSString *)rTitleForRow: (NSInteger)row;

/** 6  */
@property (nonatomic) NSMutableArray<ZLLYearHotsSetsModel *> *dataHotList;
@property (nonatomic) NSInteger rowHotNumber;
- (NSURL *)iconHeadIVForRow: (NSInteger)row;
- (NSInteger)rIdHeadForRow: (NSInteger)row;
- (NSString *)titleHeadForRow: (NSInteger)row;
@end
