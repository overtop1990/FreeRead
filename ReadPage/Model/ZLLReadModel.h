//
//  ZLLReadModel.h
//  TRProject
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZLLReadDatasModel,ZLLReadDatasTagsModel;
@interface ZLLReadModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<ZLLReadDatasModel *> *datas;

@end
@interface ZLLReadDatasModel : NSObject

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<ZLLReadDatasTagsModel *> *tags;
//create_time -> createTime
@property (nonatomic, copy) NSString *createTime;
//show_uid -> showUid
@property (nonatomic, copy) NSString *showUid;

@property (nonatomic, copy) NSString *lead;
//hot_comments -> hotcomments
@property (nonatomic, strong) NSArray *hotComments;

@property (nonatomic, assign) NSInteger parseXML;

@property (nonatomic, copy) NSString *share;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *video;
//publish_time -> publishTime
@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *good;

@property (nonatomic, copy) NSString *name;
//fm_play -> fmPlay
@property (nonatomic, copy) NSString *fmPlay;

@property (nonatomic, copy) NSString *category;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *fm;

@property (nonatomic, copy) NSString *bookmark;

@property (nonatomic, copy) NSString *model;

@property (nonatomic, assign) NSInteger tpl;
//link_url -> linkUrl
@property (nonatomic, copy) NSString *linkUrl;
//update_time -> updateTime
@property (nonatomic, copy) NSString *updateTime;

@property (nonatomic, copy) NSString *excerpt;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *author;

@end

@interface ZLLReadDatasTagsModel : NSObject

@property (nonatomic, copy) NSString *name;

@end

