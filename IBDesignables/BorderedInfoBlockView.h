//
//  BorderedInfoBlockView.h
//  pyggbank
//
//  Created by Thiago Holanda on 10/3/15.
//  Copyright © 2015 Inventos Digitais. All rights reserved.
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
