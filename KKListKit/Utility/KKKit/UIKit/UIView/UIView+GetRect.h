//
//  UIView+GetRect.h
//  PolyCSM
//
//  Created by LV on 16/4/18.
//  Copyright © 2016年 lvhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GetRect)

// 绝对坐标
@property (nonatomic) CGPoint lvOrigin;
@property (nonatomic) CGSize  lvSize;

@property (nonatomic) CGFloat lvX;
@property (nonatomic) CGFloat lvY;
@property (nonatomic) CGFloat lvWidth;
@property (nonatomic) CGFloat lvHeight;

@property (nonatomic) CGFloat lvTop;
@property (nonatomic) CGFloat lvBottom;
@property (nonatomic) CGFloat lvLeft;
@property (nonatomic) CGFloat lvRight;

@property (nonatomic) CGFloat lvCenterX;
@property (nonatomic) CGFloat lvCenterY;

// 相对坐标
@property (nonatomic, readonly) CGFloat lvMiddleHorizon;
@property (nonatomic, readonly) CGFloat lvMiddleVertical;
@property (nonatomic, readonly) CGPoint lvMiddlePoint;

- (UIView *)subViewOfClassName:(NSString*)className;

// 不推荐使用，离屏渲染影响性能
- (CAShapeLayer *)maskShaper:(CGRect)bounds radius:(CGFloat)radiusValue UIRectCornerValue:(UIRectCorner)rectCorner;

// Scale alpha
@property (nonatomic) CGFloat scale; ///< CGAffineTransformMakeScale .GPU Rendering+Blinding
@property (nonatomic) CGFloat angle; ///< CGAffineTransformMakeRotation

@end
