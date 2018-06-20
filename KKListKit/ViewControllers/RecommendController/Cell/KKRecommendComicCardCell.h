//
//  KKRecommendComicCardCell.h
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KKHomeListModel.h"


/**
 新漫画推荐卡片,新作推荐
 */
@interface KKRecommendNewComicCardCell : UICollectionViewCell

@end







/**
 每日更新漫画推荐卡片
 */
@interface KKRecommendUpdateComicCardCell : UICollectionViewCell

@end







/**
 正常漫画推荐卡片
 */
@interface KKRecommendNormalComicCardCell : UICollectionViewCell

@property (nonatomic, strong) KKHomeTopicModel *model;

@end
