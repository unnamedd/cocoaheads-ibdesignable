//
//  UIView+Custom.h
//  pyggbank
//
//  Created by Thiago Holanda on 8/30/15.
//  Copyright (c) 2015 Inventos Digitais. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

- (void) drawSimpleShadowToView;

@end


typedef NS_ENUM(NSInteger, CALayerBorderPosition) {
    CALayerBorderPositionTop,
    CALayerBorderPositionRight,
    CALayerBorderPositionBottom,
    CALayerBorderPositionLeft,
    CALayerBorderNotExist
};

@interface CALayer (Border)

@property (assign, readonly, nonatomic) CALayerBorderPosition borderPosition;

@end

@interface UIView (Border)

- (CALayer *) addBorderToPosition:(CALayerBorderPosition) position color:(UIColor *) color width:(CGFloat) width;

@end

@interface UIView (CustomAnimations)

- (void) animateToAlpha:(CGFloat) alpha duration:(NSTimeInterval) duration;

@end
