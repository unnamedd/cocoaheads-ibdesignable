//
//  ConclusionPercentageBarView.h
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIViewWithBorders.h"

IB_DESIGNABLE
@interface ConclusionPercentageBarView : UIViewWithBorders

@property (strong, nonatomic)       IBInspectable UIImage       *leftIcon;
@property (strong, nonatomic)       IBInspectable NSString      *topPlaceholder;
@property (strong, nonatomic)       IBInspectable UIColor       *topColor;
@property (strong, nonatomic)       IBInspectable NSString      *topValue;
@property (strong, nonatomic)       IBInspectable UIColor       *topValueColor;

@property (readwrite, nonatomic)    IBInspectable NSInteger     percentLeft;
@property (strong, nonatomic)       IBInspectable NSString      *bottomPlaceholder;
@property (strong, nonatomic)       IBInspectable UIColor       *bottomColor;
@property (strong, nonatomic)       IBInspectable NSString      *bottomValue;
@property (strong, nonatomic)       IBInspectable UIColor       *bottomValueColor;

@property (strong, nonatomic)       IBInspectable UIColor       *trackColor;
@property (strong, nonatomic)       IBInspectable UIColor       *barColor;

@end

