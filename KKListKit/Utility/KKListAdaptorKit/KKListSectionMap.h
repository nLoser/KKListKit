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

- (instancetype)initWithObjectToSectionControllerMap:(NSMapTable *)mapTable NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSArray *objects;

#pragma mark - Items

- (nullable id)sectionControllerForSection:(NSInteger)section;

- (nullable id)sectionControllerForObject:(id)object;

- (NSInteger)sectionForSectionController:(id)sectionController;

- (NSInteger)sectionForObject:(id)object;

- (nullable id)objectForSection:(NSInteger)section;

#pragma mark - Data Operation

- (void)configurationWithObjects:(NSArray *)objects
               sectionController:(NSArray <KKListSectionController *> *)sectionControllers;

/**
 更新Objects中需要更新的object
 
 @param object 需要更新object
 */
- (void)updateObject:(id)object;

- (void)reset;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
