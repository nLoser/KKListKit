//
//  KKHomeListModel.m
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKHomeListModel.h"

#import <YYKit/NSObject+YYModel.h>

#import "KKHomeSectionControllerList.h"

@implementation KKHomeListModel

@end

@implementation KKHomeBannerModel

@end

@implementation KKHomeTopicModel
//YY
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{@"descriptionString":@"description"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"tags":[NSString class]};
}
//预计算
- (NSString *)tagString {
    if (_tagString) {
        return _tagString;
    }
    _tagString = @"漫画";
    if (_tags.count > 0) {
        NSMutableString *string = [NSMutableString string];
        for (NSInteger i = 0 ; i < _tags.count; i ++) {
            [string appendFormat:@"%@%@",_tags[i],i > 0 ? @" ":@""];
        }
        _tagString = string;
    }
    return _tagString;
}
@end

@implementation KKHomeItemLatestComicInfoModel

@end

@implementation KKHomeListResultDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"info_list":[KKHomeModuleDataModel class]};
}

@end

@implementation KKHomeListResultModel

@end

@implementation KKHomeModuleDataModel

- (instancetype)init {
    if (self = [super init]) {
        _item_type = -1;
    }
    return self;
}

- (IGListSectionController *)sectionController {
    if (_sectionController) {
        return _sectionController;
    }
    IGListSectionController *tempSectionController;
    switch (_item_type) {
        case kHomeStypleItemTypeBanner: {
            tempSectionController = [KKBannerSectionController new];
        }
            break;
        case kHomeStypleItemTypeFunctionEntrance: {
            tempSectionController = [KKFunctionItemSectionController new];
        }
            break;
        case kHomeStypleItemTypeDailysRecommend: {
            tempSectionController = [KKDailyRecommendSectionController new];
        }
            break;
        case kHomeStypleItemTypeAIRecommend: {
            tempSectionController = [KKAISectionController new];
        }
            break;
        case kHomeStypleItemTypeNomalListRecommend: {
            tempSectionController = [KKListRecommendSectionController new];
        }
            break;
        case kHomeStypleItemTypeTodayReommend: {
            tempSectionController = [KKTodayReommendSectionController new];
        }
            break;
        case kHomeStypleItemTypeHotRecommend: {
            tempSectionController = [KKHotRecommendSectionController new];
        }
            break;
        case kHomeStypleItemTypeNewRecommend: {
            //tempSectionController = [KKNewRecommendSectionController new];
            //NOTE:测试
            tempSectionController = [KKListRecommendSectionController new];
        }
            break;
        default:
            tempSectionController = [KKEmptySectionController new];
            break;
    }
    _sectionController = tempSectionController;
    return _sectionController;
}

//YYModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"banners":[KKHomeBannerModel class],
             @"topics":[KKHomeTopicModel class],
             @"today_topics":[KKHomeTopicModel class]
             };
}

//IGListKitDiff
- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object ? YES : [self isEqual:object];
}

@end
