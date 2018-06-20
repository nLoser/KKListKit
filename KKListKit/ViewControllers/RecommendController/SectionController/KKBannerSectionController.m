//
//  KKBannerSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKBannerSectionController.h"

#import "LVInfinitelyCycleView.h"

#import "KKHomeListModel.h"

@interface KKBannerSectionController ()

@property (nonatomic, strong) NSArray <KKHomeBannerModel *> *dataArray;
@property (nonatomic, strong) LVInfinitelyCycleView *bannerView;

@end

@implementation KKBannerSectionController

- (void)didUpdateToObject:(KKHomeModuleDataModel *)object {
    self.dataArray = object.banners;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, width * 0.62);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    if (!_bannerView) {
        _bannerView = [[LVInfinitelyCycleView alloc] initWithFrame:cell.contentView.bounds];
        _bannerView.backgroundColor = kMainStyleColor;
        [cell addSubview:_bannerView];
        [self reloadData];
    }
    return cell;
}

#pragma mark - Private Method

- (void)reloadData {
    NSMutableArray *array = [NSMutableArray array];
    for (KKHomeBannerModel *model in self.dataArray) {
        [array addObject:model.pic];
    }
    [_bannerView setBannerIamgeUrlGroup:array];
}

@end
