//
//  KKControllerFactory.m
//  KKListKit
//
//  Created by LV on 2018/6/14.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKControllerFactory.h"

#import "KKMainTabBarController.h"
#import "KKRecommendController.h"

@implementation KKControllerFactory

+ (UIViewController *)mainTabBarController {
    KKMainTabBarController *tabbarController = [[KKMainTabBarController alloc] init];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:[self recommendController]];
    tabbarController.viewControllers = @[nc];
    
    return tabbarController;
}

+ (UIViewController *)recommendController {
    KKRecommendController *recommendController = [[KKRecommendController alloc] init];
    recommendController.title = @"无限漫画";
    return recommendController;
}

@end
