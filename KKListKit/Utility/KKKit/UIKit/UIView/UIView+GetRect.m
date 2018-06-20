//
//  UIView+GetRect.m
//  PolyCSM
//
//  Created by LV on 16/4/18.
//  Copyright © 2016年 lvhongyang. All rights reserved.
//

#import "UIView+GetRect.h"
#import <objc/runtime.h>

@implementation UIView (GetRect)

- (CGPoint)lvOrigin {
    return self.frame.origin;
}

- (void)setLvOrigin:(CGPoint)lvOrigin {
    
    if (isnan(lvOrigin.x || isnan(lvOrigin.y))) {
        return;
    }
    
    CGRect newFrame = self.frame;
    newFrame.origin = lvOrigin;
    self.frame      = newFrame;
}

- (CGSize)lvSize {
    return self.frame.size;
}

- (void)setLvSize:(CGSize)lvSize {
    
    if (isnan(lvSize.height) || isnan(lvSize.width)) {
        return;
    }
    
    CGRect newFrame = self.frame;
    newFrame.size   = lvSize;
    self.frame      = newFrame;
}

- (CGFloat)lvX {
    return self.frame.origin.x;
}

- (void)setLvX:(CGFloat)lvX {
    
    if (isnan(lvX)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = lvX;
    self.frame        = newFrame;
}

- (CGFloat)lvY {
    return self.frame.origin.y;
}

- (void)setLvY:(CGFloat)lvY {
    
    if (isnan(lvY)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = lvY;
    self.frame        = newFrame;
}

- (CGFloat)lvWidth {
    return self.frame.size.width;
}

- (void)setLvWidth:(CGFloat)lvWidth {
    if (isnan(lvWidth)) {
        return;
    }
    
    CGRect newFrame     = self.frame;
    newFrame.size.width = lvWidth;
    self.frame          = newFrame;
}

- (CGFloat)lvHeight {
    return self.frame.size.height;
}

- (void)setLvHeight:(CGFloat)lvHeight {
    
    if (isnan(lvHeight)) {
        return;
    }
    
    CGRect newFrame      = self.frame;
    newFrame.size.height = lvHeight;
    self.frame           = newFrame;
}

- (CGFloat)lvTop {
    return self.frame.origin.y;
}

- (void)setLvTop:(CGFloat)lvTop {
    
    if (isnan(lvTop)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = lvTop;
    self.frame        = newFrame;
}

- (CGFloat)lvBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLvBottom:(CGFloat)lvBottom {
    
    if (isnan(lvBottom)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = lvBottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)lvLeft {
    return self.frame.origin.x;
}

- (void)setLvLeft:(CGFloat)lvLeft {
    
    if (isnan(lvLeft)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = lvLeft;
    self.frame        = newFrame;
}

- (CGFloat)lvRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLvRight:(CGFloat)lvRight {
    
    if (isnan(lvRight)) {
        return;
    }
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = lvRight - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)lvCenterX {
    return self.center.x;
}

- (void)setLvCenterX:(CGFloat)lvCenterX {
    
    if (isnan(lvCenterX)) {
        return;
    }
    
    CGPoint newCenter = self.center;
    newCenter.x = lvCenterX;
    self.center = newCenter;
}


- (CGFloat)lvCenterY {
    return self.center.y;
}

- (void)setLvCenterY:(CGFloat)lvCenterY {
    
    if (isnan(lvCenterY)) {
        return;
    }
    
    CGPoint newCenter = self.center;
    newCenter.y = lvCenterY;
    self.center = newCenter;
}

- (CGFloat)lvMiddleHorizon {
    return CGRectGetWidth(self.bounds)/2.f;
}

- (CGFloat)lvMiddleVertical {
    return CGRectGetHeight(self.bounds)/2.f;
}

- (CGPoint)lvMiddlePoint {
    return CGPointMake(CGRectGetWidth(self.bounds)/2.f, CGRectGetHeight(self.bounds)/2.f);
}

- (UIView *)subViewOfClassName:(NSString*)className {
    for (UIView * subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView * resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}

- (CAShapeLayer *)maskShaper:(CGRect)bounds radius:(CGFloat)radiusValue UIRectCornerValue:(UIRectCorner)rectCorner{
    CAShapeLayer * maskShaper = [CAShapeLayer layer];
    maskShaper.frame = bounds;
    CGSize radiusSize = CGSizeMake(radiusValue, radiusValue);
    UIBezierPath * maskCorn = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:rectCorner cornerRadii:radiusSize];
    maskShaper.path = maskCorn.CGPath;
    return maskShaper;
}

//--------------------------------------
// Scale alpha
//--------------------------------------

- (CGFloat)scale {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setScale:(CGFloat)scale {
    objc_setAssociatedObject(self, @selector(scale), @(scale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeScale(scale, scale);
}

- (CGFloat)angle {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setAngle:(CGFloat)angle {
    objc_setAssociatedObject(self, @selector(angle), @(angle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeRotation(angle);
}

@end
