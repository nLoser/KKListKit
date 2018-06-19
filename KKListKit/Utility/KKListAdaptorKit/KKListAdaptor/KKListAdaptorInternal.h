//
//  KKListAdaptorInternal.h
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKListAdaptor.h"
#import "KKListAdaptor+UICollectionView.h"

#import "KKListSectionMap.h"

#import "KKListAssert.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKListAdaptor() <KKListCollectionContext>

@property (nonatomic, strong, readonly) KKListSectionMap *sectionMap;

@property (nonatomic, strong) NSMutableSet<Class> *registerCellClass;
@property (nonatomic, strong) NSMutableSet<NSString *> *registerNibName;
@property (nonatomic, strong) NSMutableSet<NSString *> *registerSupplementaryViewIdentifiers;
@property (nonatomic, strong) NSMutableSet<NSString *> *registerSupplementaryViewNibView;

@property (nonatomic, assign) BOOL isInUpdateBatchBlock;

@end

NS_ASSUME_NONNULL_END
