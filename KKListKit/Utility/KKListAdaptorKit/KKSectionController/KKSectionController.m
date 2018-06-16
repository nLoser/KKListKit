//
//  KKSectionController.m
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKSectionControllerInternal.h"
#import "KKAssert.h"

@interface KKSectionControllerThreadContext : NSObject
@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id collectionContext;
@end
@implementation KKSectionControllerThreadContext
@end

static NSMutableArray<KKSectionControllerThreadContext *> *threadContextStack(void) {
    KKAssertMainThread();
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSMutableArray *stack = threadDictionary[@"threadContextKey"];
    if (stack == nil) {
        stack = [NSMutableArray array];
        threadDictionary[@"threadContextKey"] = stack;
    }
    return stack;
}

void KKSectionControllerPushThread(UIViewController *viewController, id collectionContext) {
    KKSectionControllerThreadContext *context = [KKSectionControllerThreadContext new];
    context.viewController = viewController;
    context.collectionContext = collectionContext;
    [threadContextStack() addObject:context];
}

void KKSectionControllerPopThread(void) {
    NSMutableArray *stack = threadContextStack();
    KKAssert(stack.count > 0, @"KKSectionController thread stack is empty!");
    [stack removeLastObject];
}

@implementation KKSectionController

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        KKAssertMainThread();
        KKSectionControllerThreadContext *context = [threadContextStack() lastObject];
        _viewController = context.viewController;
        _collectionContext = context.collectionContext;
        
        KKAssert(_collectionContext, @"SectionController context must be exist!");
        _section = NSNotFound;
    }
    return self;
}

#pragma mark - NeedOverride

- (NSInteger)numberOfItems {
    return 1;
}

- (UICollectionViewCell *)cellForItemsAtIndex {
    KKAssert(NO, @"Section Controller %@ must override %s:", self, __PRETTY_FUNCTION__);
    return nil;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeZero;
}

@end
