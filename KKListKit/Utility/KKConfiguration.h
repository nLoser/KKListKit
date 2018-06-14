//
//  KKConfiguration.h
//  KKListKit
//
//  Created by LV on 2018/6/14.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN UIColor *kMainStyleColor;         ///< 主品牌色
FOUNDATION_EXTERN UIColor *kSimilarMainStyleColor;  ///< 品牌相似色
FOUNDATION_EXTERN UIColor *kLowerstColor;           ///< 底色
FOUNDATION_EXTERN UIColor *kMainGrayColor;          ///< 灰色按钮色
FOUNDATION_EXTERN UIColor *kLineColor;              ///< 间隔线色
FOUNDATION_EXTERN UIColor *kTextDarkColor;          ///< 深度颜色
FOUNDATION_EXTERN UIColor *kTextNormalDarkColor;    ///< 稍微深度颜色
FOUNDATION_EXTERN UIColor *kTextLightDarkColor;     ///< 浅深度颜色
FOUNDATION_EXTERN UIColor *kTextLightColor;         ///< 亮度颜色

@interface KKConfiguration : NSObject

+ (void)configureEnvrionment;

@end

NS_ASSUME_NONNULL_END
