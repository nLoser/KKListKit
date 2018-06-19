//
//  KKListSectionMap.m
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListSectionMap.h"

#import "KKListAssert.h"

#import "KKListSectionControllerInternal.h"

@interface KKListSectionMap ()

@property (nonatomic, strong, nullable, readonly) NSMapTable<id, KKListSectionController *> *objectToSectionControllerMap;
@property (nonatomic, strong, nullable, readonly) NSMapTable<KKListSectionController *, NSNumber *> *sectionControllerToSectionMap;
@property (nonatomic, strong, nullable) NSMutableArray *mObjects; ///< 保证section顺序

@end

@implementation KKListSectionMap

#pragma mark - Life Cycle

- (instancetype)initWithObjectToSectionControllerMap:(NSMapTable *)mapTable {
    if (self = [super init]) {
        _objectToSectionControllerMap = [mapTable copy];
        _sectionControllerToSectionMap = [[NSMapTable alloc] initWithKeyOptions:NSMapTableStrongMemory | NSMapTableObjectPointerPersonality
                                                                   valueOptions:NSMapTableStrongMemory
                                                                       capacity:0];
        _mObjects = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Getter

- (NSArray *)objects {
    return [self.mObjects copy];
}

#pragma mark - Public Method

- (nullable id)sectionControllerForObject:(id)object {
    KKParameterAssert(!object);
    return [self.objectToSectionControllerMap objectForKey:object];
}

- (NSInteger)sectionForSectionController:(id)sectionController {
    KKParameterAssert(!sectionController);
    
    NSNumber *index = [self.sectionControllerToSectionMap objectForKey:sectionController];
    if (!index) {
        return NSNotFound;
    } else {
        return [index integerValue];
    }
}

- (NSInteger)sectionForObject:(id)object {
    KKParameterAssert(!object);
    
    id sectionController = [self.objectToSectionControllerMap objectForKey:object];
    if (!sectionController) {
        return NSNotFound;
    } else {
        return [self sectionForSectionController:sectionController];
    }
}

- (nullable id)objectForSection:(NSInteger)section {
    NSArray *objects = self.mObjects;
    if (section < objects.count) {
        return objects[section];
    } else {
        return nil;
    }
}

- (nullable id)sectionControllerForSection:(NSInteger)section {
    return [self.objectToSectionControllerMap objectForKey:[self objectForSection:section]];
}

#pragma mark - Public Method - DataSource

- (void)configurationWithObjects:(NSArray *)objects sectionController:(NSArray <KKListSectionController *> *)sectionControllers {
    KKParameterAssert(objects.count == sectionControllers.count);

    [self reset];
    
    //id firstObject = objects.firstObject;
    //id lastObject = objects.lastObject;
    
    [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        KKListSectionController *sectionController = sectionControllers[idx];
        
        [self.sectionControllerToSectionMap setObject:@(idx) forKey:sectionController];
        [self.objectToSectionControllerMap setObject:sectionController forKey:obj];
        sectionController.section = (NSInteger)idx;
    }];
}

- (void)updateObject:(id)object {
    KKParameterAssert(!object);
    
    const NSInteger section = [self sectionForObject:object];
    id sectionController = [self sectionControllerForSection:section];
    
    [self.sectionControllerToSectionMap setObject:@(section) forKey:sectionController];
    [self.objectToSectionControllerMap setObject:sectionController forKey:object];
    self.mObjects[section] = object;
}

#pragma mark - Private Method

- (void)reset {
    [self enumerateUsingBlock:^(id object, KKListSectionController *sectionController, NSInteger section, BOOL *stop) {
        sectionController.section = NSNotFound;
    }];
    [self.sectionControllerToSectionMap removeAllObjects];
    [self.objectToSectionControllerMap removeAllObjects];
}

- (void)enumerateUsingBlock:(void (^)(id object, KKListSectionController *sectionController, NSInteger section, BOOL *stop))block {
    KKParameterAssert(!block);
    
    BOOL stop = NO;
    NSArray *objects = self.objects;
    for (NSInteger section = 0 ; section < objects.count; section ++) {
        id object = [self objectForSection:section];
        KKListSectionController *sectionController = [self sectionControllerForObject:object];
        block(object, sectionController, section, &stop);
        if (stop) {
            break;
        }
    }
}

@end


































