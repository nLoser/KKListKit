//
//  KKFunctionItemEntranceCell.m
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKFunctionItemEntranceCell.h"

#import <YYKit/UIImageView+YYWebImage.h>

@interface KKFunctionItemEntranceCell ()

@property (nonatomic, strong) UIImageView *functionItemIamgeView;

@property (nonatomic, strong) KKHomeBannerModel *model;

@end

@implementation KKFunctionItemEntranceCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kSimilarMainStyleColor;
        [self addSubview:self.functionItemIamgeView];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.functionItemIamgeView cancelCurrentImageRequest];
    self.model = nil;
}

#pragma mark - Getter

- (UIImageView *)functionItemIamgeView {
    if (!_functionItemIamgeView) {
        _functionItemIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, CGRectGetHeight(self.bounds)-20, CGRectGetHeight(self.bounds)-20)];
        _functionItemIamgeView.lvCenterX = CGRectGetWidth(self.bounds)/2.f;
        _functionItemIamgeView.backgroundColor = kMainGrayColor;
    }
    return _functionItemIamgeView;
}

#pragma mark - KKHomeCellModelDataSource

- (void)updateToObject:(KKHomeBannerModel *)object {
    self.model = object;
    [self.functionItemIamgeView setImageURL:[NSURL URLWithString:self.model.pic]];
}

@end
