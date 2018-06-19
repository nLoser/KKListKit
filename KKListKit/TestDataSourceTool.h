//
//  TestDataSourceTool.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//
//NOTE:测试

#import <Foundation/Foundation.h>

#import "KKHomeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestDataSourceTool : NSObject

+ (KKHomeListResultModel *)requestHomeListResult;

@end

NS_ASSUME_NONNULL_END
