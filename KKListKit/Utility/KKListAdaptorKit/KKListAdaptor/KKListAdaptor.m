//
//  KKListAdaptor.m
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListAdaptorInternal.h"
#import "KKListAssert.h"

@implementation KKListAdaptor

#pragma mark - LifeCycle

- (instancetype)initWithViewController:(UIViewController *)viewController {
    KKAssertMainThread();
    if (self = [super init]) {
        _viewController = viewController;
    }
    return self;
}

#pragma mark - Setter

- (void)setCollectionView:(UICollectionView *)collectionView {
    KKAssertMainThread();
    if (_collectionView != collectionView || _collectionView.dataSource != self) {
        
        _registerCellClass = [NSMutableSet new];
        _registerNibName = [NSMutableSet new];
        _registerSupplementaryViewIdentifiers = [NSMutableSet new];
        _registerSupplementaryViewNibView = [NSMutableSet new];
        
        _collectionView = collectionView;
        _collectionView.dataSource = self;
        [_collectionView.collectionViewLayout invalidateLayout];
        
        [self updateAfterPublicSettingChange];
    }
}

- (void)setDataSource:(id<KKListAdaptorDataSource>)dataSource {
    if (_dataSource != dataSource) {
        _dataSource = dataSource;
        [self updateAfterPublicSettingChange];
    }
}

#pragma mark - Public Method

- (nullable KKListSectionController *)sectionControllerForSection:(NSInteger)section {
    KKAssertMainThread();
    return [self.sectionMap sectionControllerForSection:section];
}

- (__kindof KKListSectionController * _Nullable )sectionControllerForObject:(id)object {
    KKAssertMainThread();
    KKParameterAssert(object != nil);
    return [self.sectionMap sectionControllerForObject:object];
}

- (NSInteger)sectionForSectionController:(KKListSectionController *)sectionController {
    KKAssertMainThread();
    KKParameterAssert(sectionController != nil);
    return [self.sectionMap sectionForSectionController:sectionController];
}

- (nullable id)objectForSection:(NSInteger)section {
    KKAssertMainThread();
    return [self.sectionMap objectForSection:section];
}

- (nullable id)objectForSectionController:(KKListSectionController *)sectionController {
    KKAssertMainThread();
    KKParameterAssert(sectionController != nil);
    NSInteger section = [self.sectionMap sectionForSectionController:sectionController];
    return [self.sectionMap objectForSection:section];
}

#pragma mark - Private Method

- (void)updateAfterPublicSettingChange {
    id<KKListAdaptorDataSource> dataSource = _dataSource;
    if (_collectionView != nil && dataSource != nil) {
        [self updateObjects:[[dataSource objectForListAdaptor:self] copy] dataSource:dataSource];
    }
}

- (void)updateEmptyViewShouldHide:(BOOL)shouldHide {
    if (self.isInUpdateBatchBlock) {
        return;
    }
    UIView *backgroundView = [self.dataSource emptyViewForListAdaptor:self];
    if (backgroundView != _collectionView.backgroundView) {
        [_collectionView.backgroundView removeFromSuperview];
        _collectionView.backgroundView = backgroundView;
    }
    _collectionView.backgroundView.hidden = shouldHide;
}

- (void)updateObjects:(NSArray *)objects dataSource:(id<KKListAdaptorDataSource>)dataSource {
    KKParameterAssert(dataSource != nil);
    
    NSMutableArray<KKListSectionController *> *sectionControllers = [NSMutableArray new];
    NSMutableArray *vaildObjects = [NSMutableArray new];
    NSMutableSet *updateObjects = [NSMutableSet new];
    
    KKSectionControllerPushThread(self.viewController, self);
    
    for (id object in objects) {
        
    }
    
    KKSectionControllerPopThread();
}

@end