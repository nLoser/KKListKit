//
//  KKConfiguration.m
//  KKListKit
//
//  Created by LV on 2018/6/14.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKConfiguration.h"

#import "UIColor+KKAdd.h"

UIColor *kMainStyleColor;         ///< 主品牌色
UIColor *kSimilarMainStyleColor;  ///< 品牌相似色
UIColor *kLowerstColor;           ///< 底色
UIColor *kMainGrayColor;          ///< 灰色按钮色
UIColor *kLineColor;              ///< 间隔线色
UIColor *kTextDarkColor;          ///< 深度颜色
UIColor *kTextNormalDarkColor;    ///< 稍微深度颜色
UIColor *kTextLightDarkColor;     ///< 浅深度颜色
UIColor *kTextLightColor;         ///< 亮度颜色

@implementation KKConfiguration

+ (void)configureEnvrionment {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self configureColor];
    });
}

+ (void)configureColor {
    kMainGrayColor = [UIColor colorWithHexString:@"FF9F9F"];
    kSimilarMainStyleColor = [UIColor colorWithHexString:@"F28686"];
    kLowerstColor = [UIColor colorWithHexString:@"F5F5F5"];
    kMainGrayColor = [UIColor colorWithHexString:@"EAEEF0"];
    kLineColor = [UIColor colorWithHexString:@"E6E6E6"];
    kTextDarkColor = [UIColor colorWithHexString:@"666666"];
    kTextNormalDarkColor = [UIColor colorWithHexString:@"999999"];
    kTextLightDarkColor = [UIColor colorWithHexString:@"C7C7C7"];
    kTextLightColor = [UIColor colorWithHexString:@"FFFFFF"];
}

@end
