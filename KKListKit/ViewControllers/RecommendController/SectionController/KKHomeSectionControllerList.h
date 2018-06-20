//
//  KKHomeSectionController.h
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKEmptySectionController.h"            ///< 当数据异常
#import "KKBannerSectionController.h"           ///< banner
#import "KKFunctionItemSectionController.h"     ///< 功能入口
#import "KKDailyRecommendSectionController.h"   ///< 近三天推荐
#import "KKHotRecommendSectionController.h"     ///< 热门推荐
#import "KKAISectionController.h"               ///< AI推荐
#import "KKTodayReommendSectionController.h"    ///< 今日推荐
#import "KKNewRecommendSectionController.h"     ///< 新品推荐
#import "KKListRecommendSectionController.h"    ///< 列表推进

typedef NS_ENUM(NSInteger, kHomeStypleItemType) {
    kHomeStypleItemTypeBanner               = 1, ///< banner
    kHomeStypleItemTypeFunctionEntrance     = 2, ///< 固定入口
    kHomeStypleItemTypeDailysRecommend      = 3, ///< 每日更新
    kHomeStypleItemTypeAIRecommend          = 4, ///< AI推荐（根据之前浏览记录推荐）
    kHomeStypleItemTypeNomalListRecommend   = 5, ///< XXX推荐列表
    kHomeStypleItemTypeTodayReommend        = 6, ///< 今日最热
    kHomeStypleItemTypeHotRecommend         = 7, ///< 热门推荐
    kHomeStypleItemTypeNewRecommend         = 8  ///< 新作推荐
};

/*
 使用这个框架
 1.创建sectionController，必须要实现dataSource的代理方法
 2.使用注册Cell的时候，一个UICollectionCell必须要对应一个reuseIdentifier
 
 */
