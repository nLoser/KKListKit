//
//  KKFunctionItemSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//  padding 6

#import "KKFunctionItemSectionController.h"

#import "KKFunctionItemEntranceCell.h"

#import "KKHomeListModel.h"

@interface KKFunctionItemSectionController ()

@property (nonatomic, strong) KKHomeModuleDataModel *datas;

@end

@implementation KKFunctionItemSectionController

#pragma mark - DataSource

- (void)didUpdateToObject:(id)object {
    self.datas = object;
}

- (NSInteger)numberOfItems {
    return self.datas.banners.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width/4.f;
    return CGSizeMake(width, 64);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    KKFunctionItemEntranceCell *cell = [self.collectionContext dequeueReusableCellOfClass:[KKFunctionItemEntranceCell class] forSectionController:self atIndex:index];
    [cell updateToObject:_datas.banners[index]];
    return cell;
}

@end
