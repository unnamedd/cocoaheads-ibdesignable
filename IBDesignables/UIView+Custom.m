//
//  UIView+Custom.m
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "UIView+Custom.h"

#import "UIColor+Custom.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (Custom)

- (void) drawSimpleShadowToView {
    UIView *shadowView = [[UIView alloc] initWithFrame: self.bounds];
    //shadowView.backgroundColor = self.backgroundColor;
    //shadowView.layer.cornerRadius = self.layer.cornerRadius;
    
    shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowOpacity = 1.0f;
    shadowView.layer.shadowRadius = 1;
    
    [self insertSubview: shadowView
                atIndex: 0];
}

@end


@implementation UIView (Border)

- (CALayer *) addBorderToPosition:(CALayerBorderPosition) position color:(UIColor *) color width:(CGFloat) width {
    CALayer *border;
    
    switch (position) {
        case CALayerBorderPositionTop: {
            border = [self addTopBorderWithColor: color
                                           width: width];
            break;
        }
        case CALayerBorderPositionRight: {
            border = [self addRightBorderWithColor: color
                                             width: width];
            break;
        }
        case CALayerBorderPositionBottom: {
            border = [self addBottomBorderWithColor: color
                                              width: width];
            break;
        }
        case CALayerBorderPositionLeft: {
            border = [self addLeftBorderWithColor: color
                                            width: width];
            break;
        }
        case CALayerBorderNotExist:
        default: {
            break;
        }
    }
    
    return border;
}

- (CALayer *) addTopBorderWithColor:(UIColor *)color width:(CGFloat) width {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.name = @"top";
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, width);
    [self.layer addSublayer:border];
    
    return border;
}

- (CALayer *) addBottomBorderWithColor:(UIColor *)color width:(CGFloat) width {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.name = @"bottom";
    
    border.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
    [self.layer addSublayer:border];
    
    return border;
}

- (CALayer *) addLeftBorderWithColor:(UIColor *)color width:(CGFloat) width {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.name = @"left";
    
    border.frame = CGRectMake(0, 0, width, self.frame.size.height);
    [self.layer addSublayer:border];
    
    return border;
}

- (CALayer *) addRightBorderWithColor:(UIColor *)color width:(CGFloat) width {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.name = @"right";
    
    border.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
    [self.layer addSublayer:border];
    
    return border;
}

@end

@implementation CALayer (Border)

- (CALayerBorderPosition) borderPosition {
    
    CALayerBorderPosition response;
    
    if ([self.name isEqualToString:@"top"])
        response = CALayerBorderPositionTop;
    
    else if ([self.name isEqualToString:@"right"])
        response = CALayerBorderPositionRight;
    
    else if ([self.name isEqualToString:@"bottom"])
        response = CALayerBorderPositionBottom;
    
    else if ([self.name isEqualToString:@"right"])
        response = CALayerBorderPositionRight;
    
    else
        response = CALayerBorderNotExist;
    
    return response;
}

@end

@implementation UIView (CustomAnimations)

- (void) animateToAlpha:(CGFloat) alpha duration:(NSTimeInterval) duration {
    [UIView animateWithDuration: duration
                     animations:^{
                         self.alpha = alpha;
                     }];
}

@end
