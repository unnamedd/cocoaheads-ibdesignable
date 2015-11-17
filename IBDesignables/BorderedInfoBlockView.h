//
//  BorderedInfoBlockView.h
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewWithBorders.h"

IB_DESIGNABLE
@interface BorderedInfoBlockView : UIViewWithBorders

@property (strong, nonatomic) IBInspectable NSString *title;
@property (strong, nonatomic) IBInspectable UIColor *titleColor;
@property (strong, nonatomic) IBInspectable NSString *value;
@property (strong, nonatomic) IBInspectable UIColor *valueColor;

@end
