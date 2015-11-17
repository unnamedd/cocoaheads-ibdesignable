//
//  UIViewWithBorders.h
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIViewWithBorders : UIControl

@property (strong, nonatomic)       IBInspectable UIColor   *borderColor;
@property (readwrite, nonatomic)    IBInspectable CGFloat   borderWidth;
@property (readwrite, nonatomic)    IBInspectable BOOL      borderTop;
@property (readwrite, nonatomic)    IBInspectable BOOL      borderRight;
@property (readwrite, nonatomic)    IBInspectable BOOL      borderBottom;
@property (readwrite, nonatomic)    IBInspectable BOOL      borderLeft;

@end

