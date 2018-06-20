//
//  KKDailyRecommendSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKDailyRecommendSectionController.h"

#import <IGListKit/IGListKit.h>

#import "KKDailyHorizontailListCell.h"
#import "KKDailyHorizontalListSectionController.h"

#import "KKHomeListModel.h"

@interface KKDailyRecommendSectionController ()

@property (nonatomic, strong) KKHomeModuleDataModel *model;

@end

@implementation KKDailyRecommendSectionController

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, width * 0.512);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

@end
