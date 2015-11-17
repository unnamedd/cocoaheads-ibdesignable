//
//  GradientView.h
//  IBDesignables
//
//  Created by Diego Ventura on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface GradientView : UIView

@property (nonatomic) IBInspectable UIColor *startColor;
@property (nonatomic) IBInspectable UIColor *endColor;
@property (nonatomic, getter=isHorizontal) IBInspectable BOOL horizontal;

@end
