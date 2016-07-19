//
//  RequestPaths.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define kBasePath @"http://static.owspace.com"
//单读页面
#define kReadPath @"/index.php?m=Home&c=Api&a=getList&model=1&p=%ld&client=iphone&show_sdv=1&page_id=%@&create_time=%@&device_id=D56218BB-0E64-4B60-AB68-E704C281748E&version=1.2.0&client=iOS"
//果壳页面
#define kNewsPath @"http://apis.guokr.com/handpick/article.json?limit=20&retrieve_type=by_since&since=%@&ad=1&category=all&orientation=before"
//那年页面
#define kYearPath @"http://click.4gshu.com:83/V2Set/readpage/oppo01/24331?number=9&page=%ld"
//那年点击页面
#define kYearContentPath @"http://click.4gshu.com:83/V2Set/info/oppo01/24331?s_id=%ld&page=%ld&number=10"


#endif /* RequestPaths_h */






