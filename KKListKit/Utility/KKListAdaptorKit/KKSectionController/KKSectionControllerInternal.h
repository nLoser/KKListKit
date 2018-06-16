//
//  KKSectionControllerInternal.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKSectionController.h"

FOUNDATION_EXTERN void KKSectionControllerPushThread(UIViewController *viewController, id collectionContext);
FOUNDATION_EXTERN void KKSectionControllerPopThread(void);

@interface KKSectionController()

@property (nonatomic, weak, nullable, readwrite) UIViewController *viewController;

@property (nonatomic, assign, readwrite) NSInteger section;

@end
