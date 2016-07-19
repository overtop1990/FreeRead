//
//  ZLLContentModel.h
//  FreeRead
//
//  Created by 朱乐乐 on 16/7/7.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZLLContentSetModel,ZLLContentContentsModel,ZLLContentContentsCatergoryModel,ZLLContentContentsAuthorModel;
@interface ZLLContentModel : NSObject

@property (nonatomic, strong) ZLLContentSetModel *set;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<ZLLContentContentsModel *> *contents;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger datastate;

@end
@interface ZLLContentSetModel : NSObject

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

@interface ZLLContentContentsModel : NSObject
//c_title -> cTitle
@property (nonatomic, copy) NSString *cTitle;

@property (nonatomic, copy) NSString *mp3path;

@property (nonatomic, copy) NSString *timeday;
//c_info_url -> cInfoUrl
@property (nonatomic, copy) NSString *cInfoUrl;

@property (nonatomic, assign) NSInteger listentime;

@property (nonatomic, copy) NSString *reader;
//word_collotTotle -> wordCollotTotle
@property (nonatomic, assign) NSInteger wordCollotTotle;

@property (nonatomic, strong) ZLLContentContentsCatergoryModel *catergory;
//c_state -> cState
@property (nonatomic, assign) NSInteger cState;
//c_desc -> cDesc
@property (nonatomic, copy) NSString *cDesc;
//recommend_state -> recommendState
@property (nonatomic, assign) NSInteger recommendState;
//c_jpg -> cJpg
@property (nonatomic, copy) NSString *cJpg;

@property (nonatomic, assign) NSInteger isMp3;

@property (nonatomic, assign) NSInteger readtime;
//return_state -> returnState
@property (nonatomic, assign) NSInteger returnState;
//c_show -> cShow
@property (nonatomic, assign) NSInteger cShow;
//c_id -> cId
@property (nonatomic, assign) NSInteger cId;
//c_type -> cType
@property (nonatomic, assign) NSInteger cType;
//c_update -> cUpdate
@property (nonatomic, copy) NSString *c_update;

@property (nonatomic, strong) ZLLContentContentsAuthorModel *author;

@end

@interface ZLLContentContentsCatergoryModel : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//c_name -> cName
@property (nonatomic, copy) NSString *cName;

@end

@interface ZLLContentContentsAuthorModel : NSObject
//u_name -> uName
@property (nonatomic, copy) NSString *uName;
//u_sign -> uSign
@property (nonatomic, copy) NSString *uSign;

@property (nonatomic, assign) NSInteger issign;
//u_icon -> uIcon
@property (nonatomic, copy) NSString *uIcon;
//u_sex -> uSex
@property (nonatomic, copy) NSString *uSex;

@property (nonatomic, assign) NSInteger wordsize;

@property (nonatomic, copy) NSString *birthday;
//u_id -> uId
@property (nonatomic, assign) NSInteger uId;

@property (nonatomic, assign) NSInteger isAttention;

@property (nonatomic, assign) NSInteger groupsize;

@end

