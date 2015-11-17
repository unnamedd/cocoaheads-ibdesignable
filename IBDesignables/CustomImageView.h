//
//  CustomImageView.h
//  IBDesignables
//
//  Created by Diego Ventura on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CustomImageView : UIControl

@property (nonatomic) IBInspectable UIImage *image;
@property (nonatomic) IBInspectable NSString *text;
@property (nonatomic) IBInspectable UIColor *textColor;

@end
