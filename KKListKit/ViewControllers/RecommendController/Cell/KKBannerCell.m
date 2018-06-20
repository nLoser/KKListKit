//
//  KKBannerCell.m
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKBannerCell.h"

@implementation KKBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.bannerView];
    }
    return self;
}

#pragma mark - Getter

- (LVInfinitelyCycleView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[LVInfinitelyCycleView alloc] initWithFrame:self.contentView.bounds];
        _bannerView.backgroundColor = kMainStyleColor;
    }
    return _bannerView;
}

@end
