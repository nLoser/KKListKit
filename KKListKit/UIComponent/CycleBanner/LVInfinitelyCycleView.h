//
//  LVInfinitelyCycleView.h
//  LVInfinitelyCycleBanner
//
//  Created by LV on 2017/11/28.
//  Copyright © 2017年 LV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LVInfinitelyCycleView : UIView
@property (nonatomic, strong) UIImage * placeholderImage;

+ (instancetype)buildDefaultCycleWithFrame:(CGRect)frame
                          placeholderImage:(UIImage *)placehoderImage;

- (void)setBannerIamgeUrlGroup:(NSArray<NSString *> *)imageUrlGroup;

@end
