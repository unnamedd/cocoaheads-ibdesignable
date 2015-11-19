//
//  ConclusionPercentageBarView.m
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "ConclusionPercentageBarView.h"

// Category
#import "UIView+Custom.h"

#define PERCENT_TO_SIZE(xy, p) ((xy * p) / 100)

@interface ConclusionPercentageBarView() {
    dispatch_once_t onceTokenViewLiveRendering;
}

@property (strong, nonatomic) UIImageView   *iconImageView;

@property (strong, nonatomic) UILabel       *topTitleLabel;
@property (strong, nonatomic) UILabel       *bottomTitleLabel;

@property (strong, nonatomic) UIView        *trackView;
@property (strong, nonatomic) UIView        *barView;

@end

@implementation ConclusionPercentageBarView

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

- (void) setup {
    self.iconImageView = [UIImageView new];
    [self addSubview: self.iconImageView];

    self.topTitleLabel = [UILabel new];
    [self addSubview: self.topTitleLabel];

    self.bottomTitleLabel = [UILabel new];
    [self addSubview: self.bottomTitleLabel];

    self.trackView = [UIView new];
    [self addSubview: self.trackView];

    self.barView = [UIView new];
    [self.trackView addSubview: self.barView];
}

- (void) prepareForInterfaceBuilder {
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
        
        if (self.leftIcon) {
            frame.size.height = PERCENT_TO_SIZE(frame.size.height, 45);
            frame.origin.y = 10;
            frame.size.width = 20;
            frame.size.height = 20;
            
            self.iconImageView.frame = frame;
            self.iconImageView.image = self.leftIcon;
            self.iconImageView.contentMode = UIViewContentModeBottom;
//            self.iconImageView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent: 0.2];
        }

        // Top Labels
        frame = self.bounds;
        frame.origin.x = self.leftIcon ? CGRectGetMaxX(self.iconImageView.frame) + 5 : 0;
        frame.size.width = frame.size.width - (self.iconImageView.frame.size.width);
        frame.size.height = PERCENT_TO_SIZE(frame.size.height, 45);
        self.topTitleLabel.frame = frame;
        self.topTitleLabel.text = self.topPlaceholder;
        self.topTitleLabel.textColor = self.topColor;
        self.topTitleLabel.font = [UIFont systemFontOfSize: 12];
        self.topTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.topTitleLabel.adjustsFontSizeToFitWidth = YES;
        self.topTitleLabel.minimumScaleFactor = 0.5;


        if (self.topPlaceholder && self.topValue)
            [self attributedStringToValue: self.topValue
                              placeholder: @"{top-value}"
                               valueColor: self.topValueColor
                                  element: self.topTitleLabel];

        // Percentage Bar
        frame = self.bounds;
        frame.origin.x = 0;
        frame.origin.y = CGRectGetMaxY(self.topTitleLabel.frame);
        frame.size.height = 4;

        self.trackView.frame = frame;
        self.trackView.backgroundColor = self.trackColor;
        self.trackView.layer.cornerRadius = frame.size.height / 2;
        self.trackView.clipsToBounds = YES;

        frame = self.bounds;
        frame.size.width = PERCENT_TO_SIZE(frame.size.width, (100 - self.percentLeft));
        frame.size.height = self.trackView.frame.size.height;
        self.barView.frame = frame;
        self.barView.backgroundColor = self.barColor;
        self.barView.layer.cornerRadius = frame.size.height / 2;



        // Bottom Labels
        frame = self.bounds;
        frame.origin.x = 0;
        frame.origin.y = CGRectGetMaxY(self.trackView.frame);
        frame.size.height = PERCENT_TO_SIZE(frame.size.height, 45);
        self.bottomTitleLabel.frame = frame;
        self.bottomTitleLabel.text = self.bottomPlaceholder;
        self.bottomTitleLabel.textColor = self.bottomColor;
        self.bottomTitleLabel.font = [UIFont systemFontOfSize: 12];
        self.bottomTitleLabel.textAlignment = NSTextAlignmentRight;
        self.bottomTitleLabel.adjustsFontSizeToFitWidth = YES;
        self.bottomTitleLabel.minimumScaleFactor = 0.5;

        if (self.bottomPlaceholder && self.bottomValue)
            [self attributedStringToValue: self.bottomValue
                              placeholder: @"{bottom-value}"
                               valueColor: self.bottomValueColor
                                  element: self.bottomTitleLabel];
    });
}

- (void) attributedStringToValue:(NSString *) value placeholder:(NSString *) placeholder valueColor:(UIColor *) valueColor element:(UILabel *) element {
    NSString *replacedValue = [element.text stringByReplacingOccurrencesOfString: placeholder
                                                                      withString: value];
    element.text = replacedValue;

    
    NSRange valueRange = [element.text rangeOfString: value];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: element.text];

    [attributedString setAttributes: @{
                                       NSFontAttributeName: [UIFont systemFontOfSize: 11],
                                       NSForegroundColorAttributeName: valueColor
                                       }
                              range: valueRange];

    element.attributedText = attributedString;
}

#pragma mark - Setter

- (void) setLeftIcon:(UIImage *) leftIcon {
    _leftIcon = leftIcon;

    if (leftIcon)
        self.iconImageView.image = self.leftIcon;
}

- (void) setTopPlaceholder:(NSString *) topPlaceholder {
    _topPlaceholder = topPlaceholder;

    self.topTitleLabel.text = topPlaceholder;
        
    if (self.topPlaceholder && self.topValue)
        [self attributedStringToValue: self.topValue
                          placeholder: @"{top-value}"
                           valueColor: self.topValueColor
                              element: self.topTitleLabel];
    
}

- (void) setTopColor:(UIColor *) topColor{
    _topColor = topColor;

}

- (void) setTopValue:(NSString *) topValue {
    _topValue = topValue;

}

- (void) setTopValueColor:(UIColor *) topValueColor {
    _topValueColor = topValueColor;

    if (self.topPlaceholder && self.topValue)
        [self attributedStringToValue: self.topValue
                          placeholder: @"{top-value}"
                           valueColor: self.topValueColor
                              element: self.topTitleLabel];
}

- (void) setPercentLeft:(NSInteger) percentLeft {
    _percentLeft = percentLeft;
    
    CGRect frame = self.bounds;
    frame.size.width = PERCENT_TO_SIZE(frame.size.width, (100 - percentLeft));
    frame.size.height = self.trackView.frame.size.height;
    self.barView.frame = frame;
    self.barView.backgroundColor = self.barColor;

}

-(void) setBottomPlaceholder:(NSString *) bottomPlaceholder {
    _bottomPlaceholder = bottomPlaceholder;
    
    self.bottomTitleLabel.text = bottomPlaceholder;
    
    if (self.bottomPlaceholder && self.bottomValue)
        [self attributedStringToValue: self.bottomValue
                          placeholder: @"{bottom-value}"
                           valueColor: self.bottomValueColor
                              element: self.bottomTitleLabel];
}

- (void) setBottomColor:(UIColor *) bottomColor {
    _bottomColor = bottomColor;
}

- (void) setBottomValue:(NSString *) bottomValue{
    _bottomValue = bottomValue;

    if (self.bottomPlaceholder && self.bottomValue)
        [self attributedStringToValue: self.bottomValue
                          placeholder: @"{bottom-value}"
                           valueColor: self.bottomValueColor
                              element: self.bottomTitleLabel];

}

- (void) setBottomValueColor:(UIColor *) bottomValueColor {
    _bottomValueColor = bottomValueColor;

}

- (void) setTrackColor:(UIColor *) trackColor {
    _trackColor = trackColor;

}

- (void) setBarColor:(UIColor *) barColor {
    _barColor = barColor;

}

@end
