//
//  ElementExampleView.m
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 Cocoaheads. All rights reserved.
//

#import "ElementExampleView.h"

@interface ElementExampleView() {
    dispatch_once_t onceTokenViewLiveRendering;
}

@end

@implementation ElementExampleView

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
    dispatch_once(&onceTokenViewLiveRendering, ^{
        
    });
}
@end
