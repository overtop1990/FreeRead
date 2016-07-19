//
//  ZLLNewsViewModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "ZLLNetManager.h"

@interface ZLLNewsViewModel : TRBaseViewModel
/** <# #>  */
//@property (nonatomic) NSString *datePicked;
/** <# #>  */
@property (nonatomic) NSMutableArray<ZLLNewsResultModel *> *dataList;
/** <# #>  */
@property (nonatomic) BOOL hasMore;

@property (nonatomic) NSInteger numberOfRow;

- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)titleForRow: (NSInteger)row;
- (NSURL *)html5ForRow: (NSInteger)row;
- (double)hwScaleForRow:(NSInteger)row;

@end
