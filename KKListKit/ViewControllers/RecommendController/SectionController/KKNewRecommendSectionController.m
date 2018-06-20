//
//  KKNewRecommendSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKNewRecommendSectionController.h"
#import "KKHomeListModel.h"

@interface KKNewRecommendSectionController ()

@property (nonatomic, strong) KKHomeModuleDataModel *model;

@end

@implementation KKNewRecommendSectionController

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, width * 0.512);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

@end
