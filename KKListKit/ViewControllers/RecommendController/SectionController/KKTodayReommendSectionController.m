//
//  KKTodayReommendSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKTodayReommendSectionController.h"

#import "KKHomeListModel.h"

#import "KKTodayReommendCell.h"

@interface KKTodayReommendSectionController () {
    CGFloat _itemGrap;
    CGFloat _itemRankWidth;
    CGFloat _itemRankHeight;
    CGFloat _itemRankSmallWidth;
    CGFloat _itemRankSmallHeight;
}

@property (nonatomic, strong) KKHomeModuleDataModel *model;

@end

@implementation KKTodayReommendSectionController

- (instancetype)init {
    if (self = [super init]) {
        [self initSetup];
    }
    return self;
}

- (void)initSetup {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    _itemGrap = 10;
    _itemRankWidth = width - _itemGrap * 2;
    _itemRankHeight = _itemRankWidth * 0.3;
    _itemRankSmallWidth = (_itemRankWidth - _itemGrap)/2.f;
    _itemRankSmallHeight = 32;
    
    self.inset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumLineSpacing = _itemGrap;
}

#pragma mark - DataSource

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (NSInteger)numberOfItems {
    return self.model.topics.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        return CGSizeMake(_itemRankWidth, _itemRankHeight);
    } else if (index < 3) {
        return CGSizeMake(_itemRankSmallWidth, _itemRankHeight);
    } else {
        return CGSizeMake(_itemRankSmallWidth, _itemRankSmallHeight);
    }
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    KKTodayReommendCell *cell = [self.collectionContext dequeueReusableCellOfClass:[KKTodayReommendCell class] forSectionController:self atIndex:index];
    [cell updateToObject:self.model.topics[index] index:(index+1)];
    return cell;
}

@end
