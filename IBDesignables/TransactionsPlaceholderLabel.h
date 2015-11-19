//
//  TransactionsPlaceholderLabel.h
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface TransactionsPlaceholderLabel : UILabel

@property (strong, nonatomic)                           IBInspectable NSString  *userName;
@property (strong, nonatomic)                           IBInspectable UIColor   *color;
@property (readwrite, nonatomic, getter=isUserBold)     IBInspectable BOOL      userBold;
@property (readwrite, nonatomic)                        IBInspectable NSInteger userHeight;

@property (strong, nonatomic)                           IBInspectable NSString  *action;
@property (strong, nonatomic)                           IBInspectable UIColor   *actionColor;
@property (readwrite, nonatomic, getter=isActionBold)   IBInspectable BOOL      actionBold;
@property (readwrite, nonatomic)                        IBInspectable CGFloat   actionHeight;

@property (strong, nonatomic)                           IBInspectable NSString  *value;
@property (strong, nonatomic)                           IBInspectable UIColor   *valueColor;
@property (readwrite, nonatomic, getter=isValueBold)    IBInspectable BOOL      valueBold;
@property (readwrite, nonatomic)                        IBInspectable NSInteger valueHeight;

- (void) viewLiveRendering;

@end
