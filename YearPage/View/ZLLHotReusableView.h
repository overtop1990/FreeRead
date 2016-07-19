//
//  ZLLHotReusableView.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "ZLLYearModel.h"

@interface ZLLHotReusableView : UICollectionReusableView
/** <# #>  */
@property (nonatomic) iCarousel *ic;
- (void)getDataFormModel: (NSMutableArray<ZLLYearHotsSetsModel *> *)model CompletionHandler: (void(^)())completionHandler;
@end
