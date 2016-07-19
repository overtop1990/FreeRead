//
//  ZLLNewsModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/5.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZLLNewsResultModel,ZLLNewsResultSourceDataModel;
@interface ZLLNewsModel : NSObject

@property (nonatomic, copy) NSString *now;

@property (nonatomic, strong) NSArray<ZLLNewsResultModel *> *result;
//ok -> NewsOK
@property (nonatomic, assign) BOOL NewsOK;

@end
@interface ZLLNewsResultModel : NSObject
//video_url -> videoUrl
@property (nonatomic, copy) NSString *videoUrl;

@property (nonatomic, copy) NSString *style;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *summary;
//replies_count -> repliesCount
@property (nonatomic, assign) NSInteger repliesCount;
//date_created -> dateCreated
@property (nonatomic, assign) NSInteger dateCreated;

//date_picked -> datePicked
@property (nonatomic, assign) NSInteger datePicked;

@property (nonatomic, copy) NSString *category;
//source_data -> sourceData
@property (nonatomic, strong) ZLLNewsResultSourceDataModel *sourceData;
//source_name -> sourceName
@property (nonatomic, copy) NSString *sourceName;
//is_top -> isTop
@property (nonatomic, assign) BOOL isTop;
// id -> ID
@property (nonatomic, assign) NSInteger ID;
//headline_img -> headlineImg
@property (nonatomic, copy) NSString *headlineImg;
//link_v2_sync_img -> linkV2SyncImg
@property (nonatomic, copy) NSString *linkV2SyncImg;
//headline_img_tb -> headlineImgTb
@property (nonatomic, copy) NSString *headlineImgTb;
//link_v2 -> linkV2
@property (nonatomic, copy) NSString *linkV2;
//page_source -> pageSource
@property (nonatomic, copy) NSString *pageSource;

@property (nonatomic, copy) NSString *author;
//reply_root_id -> replyRootId
@property (nonatomic, assign) NSInteger replyRootId;

@end

@interface ZLLNewsResultSourceDataModel : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *summary;

@end

