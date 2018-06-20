//
//  KKTitleSectionHeadReusableView.m
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKTitleSectionHeadReusableView.h"

@interface KKTitleSectionHeadReusableView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation KKTitleSectionHeadReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kTextLightColor;
        CALayer *lineLayer = [CALayer layer];
        lineLayer.backgroundColor = kLineColor.CGColor;
        lineLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 6);
        [self.layer addSublayer:lineLayer];
        
        [self addSubview:self.titleLabel];
    }
    return self;
}

#pragma mark - Setter

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
    _titleLabel.lvWidth = 200;
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 0, 16)];
        _titleLabel.lvBottom = self.lvHeight;
        _titleLabel.textColor = kTextDarkColor;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

@end
