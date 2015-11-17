//
//  BorderedInfoBlockView.m
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "BorderedInfoBlockView.h"

#import "UIView+Custom.h"
//#import "UIFont+Gotham.h"

@interface BorderedInfoBlockView() {
    dispatch_once_t onceTokenViewLiveRendering;
}

@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) CGRect titleRect;

@property (strong, nonatomic) UILabel *valueLabel;
@property (assign, nonatomic) CGRect valueRect;

@end

@implementation BorderedInfoBlockView

- (instancetype) initWithCoder:(NSCoder *) aDecoder{
    self = [super initWithCoder: aDecoder];
    
    if (self)
        [self setup];

    return self;
}

- (instancetype) initWithFrame:(CGRect) frame{
    self = [super initWithFrame: frame];
    
    if (self)
        [self setup];

    return self;
}

-(void) setup {
    self.titleLabel = [UILabel new];
    self.titleLabel.text = self.title;
    [self addSubview: self.titleLabel];

    self.valueLabel = [UILabel new];
    self.valueLabel.text = self.value;
    [self addSubview: self.valueLabel];
}

-(void) prepareForInterfaceBuilder {
    [self viewLiveRendering];
}

- (void) drawRect:(CGRect) rect {
    [super drawRect: rect];
#ifndef TARGET_INTERFACE_BUILDER
    [self viewLiveRendering];
#endif
}

- (void) viewLiveRendering {
    dispatch_once(&onceTokenViewLiveRendering, ^{

        CGRect frame = self.bounds;
        frame.size.height = CGRectGetHeight(frame)/2;
        self.titleLabel.frame = frame;
        self.titleLabel.text = self.title;
        self.titleLabel.textColor = self.titleColor;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.titleLabel.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent: 0.2];

        frame = self.bounds;
        frame.origin.y = CGRectGetMaxY(self.titleLabel.frame);
        frame.size.height = CGRectGetHeight(frame)/2;
        self.valueLabel.frame = frame;
        self.valueLabel.text = self.value;
        self.valueLabel.textColor = self.valueColor;
        self.valueLabel.textAlignment = NSTextAlignmentCenter;
//        self.valueLabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent: 0.2];
    });
}

#pragma mark - Setter

- (void) setTitle:(NSString *) title {
    _title = title;

    if (title && ![title isEqualToString:@""])
        self.titleLabel.text = title;
}

- (void) setValue:(NSString *) value {
    _value = value;

    if (value && ![value isEqualToString:@""])
        self.valueLabel.text = value;
}

@end

