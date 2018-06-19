//
//  LVInfinitelyCycleCollectionCell.m
//  LVInfinitelyCycleBanner
//
//  Created by LV on 2017/11/28.
//  Copyright © 2017年 LV. All rights reserved.
//

#import "LVInfinitelyCycleCollectionCell.h"
#import <YYKit/UIImageView+YYWebImage.h>

NSString * const kLVInfinitelyCycleCollectionCellIndentifier = @"kLVInfinitelyCycleCollectionCellIndentifier";

@interface LVInfinitelyCycleCollectionCell()
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation LVInfinitelyCycleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private

- (void)setUpUI {
    [self.contentView addSubview:self.imageView];
}

#pragma mark - Setter

- (void)setImageUrl:(NSString *)imageUrl {
    if(!imageUrl || imageUrl == (id)kCFNull) return;
    [self.imageView setImageURL:[NSURL URLWithString:imageUrl]];
}

#pragma mark - Getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor orangeColor];
    }
    return _imageView;
}

#pragma mark - Override

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}


@end
