//
//  KKSectionControllerInternal.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListSectionController.h"

FOUNDATION_EXTERN void KKSectionControllerPushThread(UIViewController *viewController, id collectionContext);
FOUNDATION_EXTERN void KKSectionControllerPopThread(void);

NS_ASSUME_NONNULL_BEGIN

@interface KKListSectionController()

@property (nonatomic, weak, readwrite) UIViewController *viewController;

@property (nonatomic, weak, readwrite) id <KKListCollectionContext> collectionContext;

@property (nonatomic, assign, readwrite) NSInteger section;

@end

NS_ASSUME_NONNULL_END
