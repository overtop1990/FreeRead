//
//  ZLLYearModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/6.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZLLYearHotsModel,ZLLYearHotsSetsModel,ZLLYearOthersModel;
@interface ZLLYearModel : NSObject

@property (nonatomic, assign) NSInteger page;
//read_others -> readOthers
@property (nonatomic, strong) NSArray<ZLLYearOthersModel *> *readOthers;
//read_hots -> readHots
@property (nonatomic, strong) ZLLYearHotsModel *readHots;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger datastate;

@end
@interface ZLLYearHotsModel : NSObject

@property (nonatomic, strong) NSArray<ZLLYearHotsSetsModel *> *sets;
//sl_id -> slId
@property (nonatomic, assign) NSInteger slId;

@property (nonatomic, copy) NSString *title;
//sl_desc -> slDesc
@property (nonatomic, copy) NSString *slDesc;

@end

@interface ZLLYearHotsSetsModel : NSObject
//r_title -> rTitle
@property (nonatomic, copy) NSString *rTitle;

@property (nonatomic, copy) NSString *createtime;
//r_size -> rSize
@property (nonatomic, assign) NSInteger rSize;

@property (nonatomic, assign) long long updatetimelong;
//r_image -> rImage
@property (nonatomic, copy) NSString *rImage;
//r_desc -> rDesc
@property (nonatomic, copy) NSString *rDesc;

@property (nonatomic, copy) NSString *updatetime;
//r_type -> rType
@property (nonatomic, assign) NSInteger rType;

@property (nonatomic, copy) NSString *cilck;
//r_word -> rWord
@property (nonatomic, copy) NSString *rWord;
//r_collectsize -> rCollectsize
@property (nonatomic, assign) NSInteger rCollectsize;
//r_jpg -> rJpg
@property (nonatomic, copy) NSString *rJpg;
//r_iscollect -> rIscollect
@property (nonatomic, assign) NSInteger rIscollect;
//r_id -> rId
@property (nonatomic, assign) NSInteger rId;

@end

@interface ZLLYearOthersModel : NSObject
//r_title -> rTitle
@property (nonatomic, copy) NSString *rTitle;

@property (nonatomic, copy) NSString *createtime;
//r_size -> rSize
@property (nonatomic, assign) NSInteger rSize;

@property (nonatomic, assign) long long updatetimelong;
//r_image -> rImage
@property (nonatomic, copy) NSString *rImage;
//r_desc -> rDesc
@property (nonatomic, copy) NSString *rDesc;

@property (nonatomic, copy) NSString *updatetime;
//r_type -> rType
@property (nonatomic, assign) NSInteger rType;

@property (nonatomic, copy) NSString *cilck;
//r_word -> rWord
@property (nonatomic, copy) NSString *rWord;
//r_collectsize -> rCollectsize
@property (nonatomic, assign) NSInteger rCollectsize;
//r_jpg -> rJpg
@property (nonatomic, copy) NSString *rJpg;
//r_iscollect -> rIscollect
@property (nonatomic, assign) NSInteger rIscollect;
//r_id -> rId
@property (nonatomic, assign) NSInteger rId;

@end

