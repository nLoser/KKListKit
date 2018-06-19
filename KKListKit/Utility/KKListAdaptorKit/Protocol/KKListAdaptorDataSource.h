//
//  KKListAdaptorDataSource.h
//  KKListKit
//
//  Created by LV on 2018/6/19.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKListAdaptor;
@class KKListSectionController;

NS_ASSUME_NONNULL_BEGIN

@protocol KKListAdaptorDataSource <NSObject>

- (NSArray *)objectForListAdaptor:(KKListAdaptor *)adaptor;

- (KKListSectionController *)listAdaptor:(KKListAdaptor *)adaptor sectionControllerForObject:(id)object;

- (UIView *)emptyViewForListAdaptor:(KKListAdaptor *)listAdaptor;

@end

NS_ASSUME_NONNULL_END
