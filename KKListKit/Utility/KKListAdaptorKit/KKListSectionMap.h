//
//  KKListSectionMap.h
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKListSectionController;

NS_ASSUME_NONNULL_BEGIN

@interface KKListSectionMap : NSObject

#pragma mark - Items

- (nullable id)sectionControllerForSection:(NSInteger)section;

- (nullable id)sectionControllerForObject:(id)object;

- (NSInteger)sectionForSectionController:(id)section;

- (nullable id)objectForSection:(NSInteger)section;

#pragma mark - Data Operation

- (void)updateObject:(id)object;

- (void)updateSection:(NSInteger)section;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
