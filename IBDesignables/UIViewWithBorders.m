//
//  UIViewWithBorders.m
//  pyggbank
//
//  Created by Thiago Holanda on 10/19/15.
//  Copyright © 2015 Inventos Digitais. All rights reserved.
//

#import "UIViewWithBorders.h"
#import "UIColor+Custom.h"
#import "UIView+Custom.h"

@implementation UIViewWithBorders

- (void) drawRect:(CGRect) rect {
    [super drawRect: rect];
    
    if (self.borderTop)
        [self addBorderToPosition: CALayerBorderPositionTop
                            color: self.borderColor ? self.borderColor : [UIColor colorForHex:@"DDDDDD"]
                            width: self.borderWidth < 0.0f ? 1.0f : self.borderWidth];
    
    if (self.borderRight)
        [self addBorderToPosition: CALayerBorderPositionRight
                            color: self.borderColor ? self.borderColor : [UIColor colorForHex:@"DDDDDD"]
                            width: self.borderWidth < 0.0f ? 1.0f : self.borderWidth];
    
    if (self.borderBottom)
        [self addBorderToPosition: CALayerBorderPositionBottom
                            color: self.borderColor ? self.borderColor : [UIColor colorForHex:@"DDDDDD"]
                            width: self.borderWidth < 0.0f ? 1.0f : self.borderWidth];
    
    if (self.borderLeft)
        [self addBorderToPosition: CALayerBorderPositionLeft
                            color: self.borderColor ? self.borderColor : [UIColor colorForHex:@"DDDDDD"]
                            width: self.borderWidth < 0.0f ? 1.0f : self.borderWidth];
    
}

@end

