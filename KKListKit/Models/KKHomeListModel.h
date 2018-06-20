//
//  KKHomeListModel.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiff.h>

@class IGListSectionController;

NS_ASSUME_NONNULL_BEGIN

@interface KKHomeListModel : NSObject
@end

@interface KKHomeItemLatestComicInfoModel : KKHomeListModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString * title;
@property (nonatomic) long long created_at;
@end

@interface KKHomeBannerModel : KKHomeListModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger action_type;
@property (nonatomic) NSInteger target_id;
@property (nonatomic, copy) NSString *target_title;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *target_web_url; ///< web
@property (nonatomic, copy) NSString *hybrid_url;
@end

@interface KKHomeTopicModel : KKHomeListModel
@property (nonatomic) NSInteger id;
@property (nonatomic) BOOL favourite;
@property (nonatomic) long long popularity;
@property (nonatomic) NSInteger comic_count;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descriptionString;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *vertical_image_url;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *author_info;
@property (nonatomic, copy) NSString *update_status;
@property (nonatomic, copy) NSString *update_day;
@property (nonatomic, copy) NSArray <NSString *> *tags;
@property (nonatomic, nullable) KKHomeItemLatestComicInfoModel *latest_comic_info;
//预计算
@property (nonatomic, copy) NSString *tagString;
@end

//Core Item Model
@interface KKHomeModuleDataModel : KKHomeListModel <IGListDiffable>
@property (nonatomic) NSInteger module_id;
@property (nonatomic) NSInteger action_type;
@property (nonatomic) NSInteger item_type;
@property (nonatomic, copy) NSString *action_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ai_recommend_type;
@property (nonatomic, copy, nullable) NSArray <KKHomeBannerModel *> *banners;
@property (nonatomic, copy, nullable) NSArray <KKHomeTopicModel *> *topics;
@property (nonatomic, copy, nullable) NSArray <KKHomeTopicModel *> *today_topics;
//预计算
@property (nonatomic) IGListSectionController *sectionController;
@end

@interface KKHomeListResultDataModel : KKHomeListModel
@property (nonatomic) long long server_time;
@property (nonatomic) NSArray <KKHomeModuleDataModel *> * info_list;
@end

@interface KKHomeListResultModel : KKHomeListModel

@property (nonatomic) NSInteger code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) KKHomeListResultDataModel *data;

@end

NS_ASSUME_NONNULL_END

