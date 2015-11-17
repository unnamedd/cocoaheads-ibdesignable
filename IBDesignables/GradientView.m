//
//  GradientView.m
//  IBDesignables
//
//  Created by Diego Ventura on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "GradientView.h"

@interface GradientView () {
    dispatch_once_t onceLiveViewRendering;
}

@end

@implementation GradientView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
#ifndef TARGET_INTERFACE_BUILDER
    [self prepareForInterfaceBuilder];
#endif
}

- (void)prepareForInterfaceBuilder {
    [self viewLiveRendering];
}

- (void)viewLiveRendering {
    dispatch_once(&onceLiveViewRendering, ^{
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        gradientLayer.colors = @[(id)self.startColor.CGColor,
                            (id)self.endColor.CGColor,
                            ];
        gradientLayer.locations = @[@0,
                               @1
                               ];
        
        if (self.isHorizontal) {
            gradientLayer.endPoint = CGPointMake(1.0, 0.0);
        } else {
            gradientLayer.endPoint = CGPointMake(0.0, 1.0);
        }
        
        [self.layer insertSublayer:gradientLayer atIndex:0];
    });
}

@end
