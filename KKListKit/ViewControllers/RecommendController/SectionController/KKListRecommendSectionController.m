//
//  KKListRecommendSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListRecommendSectionController.h"

#import "KKHomeListModel.h"

#import "KKRecommendComicCardCell.h"
#import "KKTitleSectionHeadReusableView.h"

@interface KKListRecommendSectionController ()

@property (nonatomic, strong) KKHomeModuleDataModel *model;

@end

@implementation KKListRecommendSectionController

- (instancetype)init {
    if (self = [super init]) {
        [self initSetup];
    }
    return self;
}

- (void)initSetup {
    self.inset = UIEdgeInsetsMake(10, 10, 12, 10);
    self.minimumLineSpacing = 14;
    self.minimumInteritemSpacing = 12;
}

#pragma mark - IGListSupplementaryViewSource

#pragma mark - DataSource

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (NSInteger)numberOfItems {
    return self.model.topics.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    width = (width - 20 - 14 - 14)/3.;
    return CGSizeMake(width, 40 + width * 1.32);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    KKRecommendNormalComicCardCell *cell = [self.collectionContext dequeueReusableCellOfClass:[KKRecommendNormalComicCardCell class] forSectionController:self atIndex:index];
    cell.model = self.model.topics[index];
    return cell;
}

@end


















