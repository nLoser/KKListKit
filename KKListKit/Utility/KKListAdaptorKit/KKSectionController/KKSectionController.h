//
//  KKSectionController.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKSectionController : NSObject

//DataSource

- (NSInteger)numberOfItems;

- (__kindof UICollectionViewCell *)cellForItemsAtIndex;

//CollectionViewDelegateFlowLayout

- (CGSize)sizeForItemAtIndex:(NSInteger)index;

//TODO:delegate

//Property

@property (nonatomic, weak, nullable, readonly) UIViewController *viewController;

@property (nonatomic, weak, nullable, readonly) id collectionContext;

@property (nonatomic, assign, readonly) NSInteger section;

@end

NS_ASSUME_NONNULL_END
