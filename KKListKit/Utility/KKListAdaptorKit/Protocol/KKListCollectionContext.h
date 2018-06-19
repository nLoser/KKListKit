//
//  KKListCollectionContext.h
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKListSectionController;

NS_ASSUME_NONNULL_BEGIN

@protocol KKListCollectionContext <NSObject>

#pragma mark - DataSource

- (nullable __kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index sectionController:(KKListSectionController *)sectionController;

- (__kindof UICollectionViewCell *)dequeueReusableCellOfClass:(Class)class
                                         forSectionController:(KKListSectionController *)sectionController
                                                      atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
