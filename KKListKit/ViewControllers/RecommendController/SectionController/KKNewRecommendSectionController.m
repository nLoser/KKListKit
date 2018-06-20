//
//  KKNewRecommendSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKNewRecommendSectionController.h"
#import "KKHomeListModel.h"

#import "KKRecommendComicCardCell.h"
#import "KKTitleSectionHeadReusableView.h"

@interface KKNewRecommendSectionController () <IGListSupplementaryViewSource>

@property (nonatomic, strong) KKHomeModuleDataModel *model;

@end

@implementation KKNewRecommendSectionController

- (instancetype)init {
    if (self = [super init]) {
        [self initSetup];
    }
    return self;
}

- (void)initSetup {
    self.inset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumLineSpacing = 12;
    self.minimumInteritemSpacing = 9;
    self.supplementaryViewSource = self;
}

#pragma mark - IGListSupplementaryViewSource

- (NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader];
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 32 + 6); //64 + 12
}

- (UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    KKTitleSectionHeadReusableView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self class:[KKTitleSectionHeadReusableView class] atIndex:index];
    view.title = self.model.title;
    return view;
}

#pragma mark - DataSource

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (NSInteger)numberOfItems {
    return self.model.topics.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    width = (width - 20 - 9)/2.;
    return CGSizeMake(width, 136/2. + width * 0.62);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    KKRecommendNewComicCardCell *cell = [self.collectionContext dequeueReusableCellOfClass:[KKRecommendNewComicCardCell class] forSectionController:self atIndex:index];
    cell.model = self.model.topics[index];
    return cell;
}

@end
