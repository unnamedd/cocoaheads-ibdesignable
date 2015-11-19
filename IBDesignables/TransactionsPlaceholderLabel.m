//
//  TransactionsPlaceholderLabel.m
//  IBDesignables
//
//  Created by Thiago Holanda on 11/17/15.
//  Copyright © 2015 CocoaHeads. All rights reserved.
//

#import "TransactionsPlaceholderLabel.h"

NSString * const placeHolderUsername = @"{username}";
NSString * const placeHolderAction = @"{action}";
NSString * const placeHolderValue = @"{value}";

@interface TransactionsPlaceholderLabel() {
    dispatch_once_t onceTokenViewLiveRendering;
}

@property (strong, nonatomic) NSMutableAttributedString *attributedStrings;

@end

@implementation TransactionsPlaceholderLabel

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
        NSMutableArray *items = [NSMutableArray new];
        
        if (self.userName && ![self.userName isEqualToString:@""]) {
            [items addObject:@{
                               @"value":        self.userName,
                               @"placeholder":  placeHolderUsername,
                               @"color":        self.color ? self.color : self.textColor,
                               @"bold":         @( self.userBold ),
                               @"height":       @( self.userHeight )
                               }];
        }
        
        if (self.action && ![self.action isEqualToString:@""]) {
            [items addObject: @{
                                @"value":       self.action,
                                @"placeholder": placeHolderAction,
                                @"color":       self.actionColor ? self.actionColor : self.textColor,
                                @"bold":        @( self.actionBold ),
                                @"height":      @( self.actionHeight )
                                }];
        }
        
        if (self.value && ![self.value isEqualToString:@""]) {
            [items addObject: @{
                                @"value":       self.value,
                                @"placeholder": placeHolderValue,
                                @"color":       self.valueColor   ? self.valueColor   : self.textColor,
                                @"bold":        @( self.valueBold ),
                                @"height":      @( self.valueHeight )
                                }];
        }
        
        
        // replace all placeholders to values
        [items enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![[obj objectForKey:@"value"] isEqualToString:@""])
                self.text = [self.text stringByReplacingOccurrencesOfString: [obj valueForKey: @"placeholder"]
                                                                 withString: [obj valueForKey: @"value"]];
        }];
        
        // apply the custom settings to each placeholder
        self.attributedStrings = [[NSMutableAttributedString alloc] initWithString: self.text];
        
        [items enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![[obj valueForKey:@"value"] isEqualToString:@""]) {
                
                NSRange valueRange = [self.text rangeOfString: [obj valueForKey: @"value"]];
                if (valueRange.location != NSNotFound) {
                    
                    NSNumber *height = (NSNumber *)[obj objectForKey: @"height"];
                    if ([[obj objectForKey: @"bold"] boolValue])
                        [self.attributedStrings addAttribute: NSFontAttributeName
                                                       value: [UIFont boldSystemFontOfSize: self.font.pointSize]
                                                       range: valueRange];
                    
                    else if (height) {
                        UIFont *font = [UIFont fontWithName: self.font.fontName
                                                       size: [height floatValue]];
                        
                        [self.attributedStrings addAttribute: NSFontAttributeName
                                                       value: font
                                                       range: valueRange];
                    }
                    
                    if ([obj valueForKey: @"color"])
                        [self.attributedStrings addAttribute: NSForegroundColorAttributeName
                                                       value: [obj valueForKey: @"color"]
                                                       range: valueRange];
                    
                }
            }
        }];
        
        if (self.attributedStrings && [self.attributedStrings length] > 0)
            self.attributedText = self.attributedStrings;
    });
}

@end
