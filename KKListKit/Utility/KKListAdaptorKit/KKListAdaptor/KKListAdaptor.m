//
//  KKListAdaptor.m
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListAdaptorInternal.h"
#import "KKListSectionControllerInternal.h"

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
        //Dequeue reusable views
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
    KKListSectionMap *map = self.sectionMap;
    
    KKSectionControllerPushThread(self.viewController, self);
    
    for (id object in objects) {
        KKListSectionController *sectionController = [map sectionControllerForObject:object];
        if (!sectionController) {
            sectionController = [dataSource listAdaptor:self sectionControllerForObject:object];
        }
        if (!sectionController) {
            NSLog(@"WARNING: return a nil section controller by dataSource %@ for object %@.", dataSource, object);
            continue;
        }
        sectionController.collectionContext = self;
        sectionController.viewController = self.viewController;
        
        const NSInteger oldSection = [map sectionForObject:object];
        if (oldSection == NSNotFound || [map objectForSection:oldSection] != object) {
            [updateObjects addObject:object];
        }
        [sectionControllers addObject:sectionController];
        [vaildObjects addObject:object];
    }
    
    KKSectionControllerPopThread();
    
    //Data:Reset map data
    [map configurationWithObjects:vaildObjects sectionController:sectionControllers];
    //UI:Reload section controller
    for (id object in updateObjects) {
        [[map sectionControllerForObject:object] didUpdateToObject:object];
    }
    
    NSInteger itemCount = 0;
    for (KKListSectionController *sectionController in sectionControllers) {
        itemCount += [sectionController numberOfItems];
    }
    [self updateEmptyViewShouldHide:itemCount > 0];
}

#pragma mark - KKListCollectionContext

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index sectionController:(KKListSectionController *)sectionController {
    return nil;
}

- (UICollectionViewCell *)dequeueReusableCellOfClass:(Class)class forSectionController:(KKListSectionController *)sectionController atIndex:(NSInteger)index {
    return nil;
}

@end










