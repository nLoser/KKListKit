//
//  KKRecommendComicCardCell.m
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKRecommendComicCardCell.h"

#import <YYKit/UIImageView+YYWebImage.h>

@implementation KKRecommendNewComicCardCell

@end












@implementation KKRecommendUpdateComicCardCell

@end












@interface KKRecommendNormalComicCardCell ()

@property (nonatomic, strong) UIImageView *comicImageView;
@property (nonatomic, strong) UILabel *comicNameLabel;
@property (nonatomic, strong) UILabel *comicTagsLabel;

@end

@implementation KKRecommendNormalComicCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.comicImageView];
        [self addSubview:self.comicTagsLabel];
        [self addSubview:self.comicNameLabel];
    }
    return self;
}

#pragma mark - Setter

- (void)setModel:(KKHomeTopicModel *)model {
    _model = model;
    _comicNameLabel.text = model.title;
    _comicTagsLabel.text = model.tagString;
    [_comicImageView setImageWithURL:[NSURL URLWithString:model.cover_image_url] options:YYWebImageOptionProgressive];
}

#pragma mark - Getter

- (UIImageView *)comicImageView {
    if (!_comicImageView) {
        _comicImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.lvWidth, self.lvHeight - 40)];
        _comicImageView.backgroundColor = kTextLightDarkColor;
    }
    return _comicImageView;
}

- (UILabel *)comicTagsLabel {
    if (!_comicTagsLabel) {
        _comicTagsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.lvWidth, 12)];
        _comicTagsLabel.lvBottom = self.lvHeight;
        _comicTagsLabel.textColor = kTextNormalDarkColor;
        _comicTagsLabel.font = [UIFont systemFontOfSize:12];
    }
    return _comicTagsLabel;
}

- (UILabel *)comicNameLabel {
    if (!_comicNameLabel) {
        _comicNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.lvWidth, 16)];
        _comicNameLabel.lvBottom = self.lvHeight - 35/2. - 1; //NOTE:小些字母间距
        _comicNameLabel.textColor = kTextDarkColor;
        _comicNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _comicNameLabel;
}

@end
