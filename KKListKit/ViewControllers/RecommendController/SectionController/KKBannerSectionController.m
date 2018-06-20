//
//  KKBannerSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKBannerSectionController.h"

#import "KKBannerCell.h"
#import "KKHomeListModel.h"

@interface KKBannerSectionController ()

@property (nonatomic, assign) BOOL needRefresh;
@property (nonatomic, strong) NSMutableArray <NSString *> *dataArray;

@end

@implementation KKBannerSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _needRefresh = NO;
        _dataArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark - DataSource

- (void)didUpdateToObject:(KKHomeModuleDataModel *)object {
    self.needRefresh = YES;
    for (KKHomeBannerModel *model in object.banners) {
        [_dataArray addObject:model.pic];
    }
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, width * 0.62);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    KKBannerCell *cell = [self.collectionContext dequeueReusableCellOfClass:[KKBannerCell class] forSectionController:self atIndex:index];
    if (self.needRefresh) {
        [cell.bannerView setBannerIamgeUrlGroup:self.dataArray];
        self.needRefresh = NO;
    }
    return cell;
}

@end
