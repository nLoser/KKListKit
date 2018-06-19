//
//  KKListAdaptor.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KKListAdaptorDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKListAdaptor : NSObject

@property (nonatomic, readonly, weak) UIViewController *viewController;

@property (nonatomic, nullable, weak) UICollectionView *collectionView;

@property (nonatomic, nullable, weak) id <KKListAdaptorDataSource> dataSource;

#pragma mark - Initialize

- (instancetype)initWithViewController:(UIViewController *)viewController NS_DESIGNATED_INITIALIZER;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Items

- (nullable KKListSectionController *)sectionControllerForSection:(NSInteger)section;

- (__kindof KKListSectionController * _Nullable )sectionControllerForObject:(id)object;

- (NSInteger)sectionForSectionController:(KKListSectionController *)sectionController;

- (nullable id)objectForSectionController:(KKListSectionController *)sectionController;

- (nullable id)objectForSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
