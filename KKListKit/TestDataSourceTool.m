//
//  TestDataSourceTool.m
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "TestDataSourceTool.h"

#import <YYKit/NSObject+YYModel.h>

@implementation TestDataSourceTool

+ (KKHomeListResultModel *)requestHomeListResult {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home" ofType:@"json"]];
    NSString *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return [KKHomeListResultModel modelWithJSON:json];
}

@end
