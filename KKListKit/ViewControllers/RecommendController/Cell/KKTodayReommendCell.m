//
//  KKTodayReommendCell.m
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKTodayReommendCell.h"

#import <YYKit/UIImageView+YYWebImage.h>

@interface KKTodayRankCoverView : UIView

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *comicNameLabel;
@property (nonatomic, strong) UILabel *comicRankLabel;

@end

@implementation KKTodayRankCoverView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.coverImageView];
        [self addSubview:self.comicNameLabel];
        [self addSubview:self.comicRankLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _coverImageView.frame = self.bounds;
    _comicNameLabel.lvTop = 12;
    _comicNameLabel.lvWidth = self.lvWidth;
    _comicRankLabel.lvBottom = 6;
    _comicRankLabel.lvWidth = self.lvWidth;
}

#pragma mark - Getter

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [UIImageView new];
    }
    return _coverImageView;
}

- (UILabel *)comicNameLabel {
    if (!_comicNameLabel) {
        _comicNameLabel = [UILabel new];
        _comicNameLabel.lvLeft = 10;
        _comicNameLabel.lvTop = 12;
        _comicNameLabel.textColor = kTextLightColor;
        _comicNameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _comicNameLabel;
}

- (UILabel *)comicRankLabel {
    if (!_comicRankLabel) {
        _comicRankLabel = [UILabel new];
        _comicRankLabel.lvLeft = 10;
        _comicRankLabel.lvBottom = 6;
        _comicRankLabel.textColor = kTextLightColor;
        _comicRankLabel.font = [UIFont systemFontOfSize:22];
    }
    return _comicNameLabel;
}

#pragma mark - Private

- (void)todayRankComicName:(NSString *)comicName comicRank:(NSInteger)comicRank {
    _comicRankLabel.text = [NSString stringWithFormat:@"NO %ld",(long)comicRank];
    _comicNameLabel.text = comicName;
}

@end



@interface KKTodayReommendCell ()

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) UIImageView *comicImageView;
@property (nonatomic, strong) KKTodayRankCoverView *rankCoverView;
@property (nonatomic, strong) UILabel *comicNameLabel;

@property (nonatomic, strong) KKHomeTopicModel *object;

@end

@implementation KKTodayReommendCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView.layer addSublayer:self.backgroundLayer];
        [self.contentView addSubview:self.comicImageView];
        [self.contentView addSubview:self.rankCoverView];
        [self.contentView addSubview:self.comicNameLabel];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.comicImageView cancelCurrentImageRequest];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _comicImageView.frame = self.contentView.bounds;
    _comicNameLabel.frame = self.contentView.bounds;
}

#pragma mark - Public

- (void)updateToObject:(KKHomeTopicModel *)object index:(NSInteger)index {
    self.object = object;
    
    BOOL hideCoverFlag = YES;
    if (index > 3) {
        _comicNameLabel.text = object.title;
        UIBezierPath *beizerPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds cornerRadius:8];
        _backgroundLayer.path = beizerPath.CGPath;
    } else {
        [_rankCoverView todayRankComicName:object.title comicRank:index];
        [_comicImageView setImageWithURL:[NSURL URLWithString:object.cover_image_url] placeholder:nil options:YYWebImageOptionProgressive manager:nil progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
            
        }];
        hideCoverFlag = NO;
    }
    
    _comicImageView.hidden = hideCoverFlag;
    _rankCoverView.hidden = hideCoverFlag;
    _comicNameLabel.hidden = !hideCoverFlag;
}

#pragma mark - Getter

- (CAShapeLayer *)backgroundLayer {
    if (!_backgroundLayer) {
        UIBezierPath *beizerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectZero cornerRadius:12];
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.path = beizerPath.CGPath;
        _backgroundLayer.fillColor = kMainGrayColor.CGColor;
    }
    return _backgroundLayer;
}

- (UIImageView *)comicImageView {
    if (!_comicImageView) {
        _comicImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _comicImageView;
}

- (KKTodayRankCoverView *)rankCoverView {
    if (!_rankCoverView) {
        _rankCoverView = [[KKTodayRankCoverView alloc] initWithFrame:CGRectZero];
    }
    return _rankCoverView;
}

- (UILabel *)comicNameLabel {
    if (!_comicNameLabel) {
        _comicNameLabel = [UILabel new];
        _comicNameLabel.textAlignment = NSTextAlignmentCenter;
        _comicNameLabel.textColor = kTextDarkColor;
        _comicNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _comicNameLabel;
}

@end
