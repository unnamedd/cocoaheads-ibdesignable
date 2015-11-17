//
//  CustomImageView.m
//  IBDesignables
//
//  Created by Diego Ventura on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "CustomImageView.h"

@interface CustomImageView () {
    dispatch_once_t onceLiveViewRendering;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *messageLabel;

@end

@implementation CustomImageView

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
    self.imageView = [UIImageView new];
    [self addSubview:self.imageView];
    
    self.messageLabel = [UILabel new];
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.messageLabel];
    
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
        self.imageView.frame = self.bounds;
        self.imageView.image = self.image;
        
        self.messageLabel.frame = self.bounds;
        self.messageLabel.text = self.text;
        self.messageLabel.textColor = self.textColor;
    });
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = _image;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.messageLabel.text = _text;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.messageLabel.textColor = _textColor;
}

@end
