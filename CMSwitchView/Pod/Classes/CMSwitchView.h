//
//  CMSwitchView.h
//
//  Created by Mycose on 31/03/2015.
//  Copyright (c) 2015 Mycose. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMSwitchViewDelegate <NSObject>
/// Called when the switch view is clicked or when you move the dot after the middle with the pan gesture
- (void)switchValueChanged:(id)sender andNewValue:(BOOL)value;
@end

@interface CMSwitchView : UIView<UIGestureRecognizerDelegate>

/// If you want to have rounded dots and switch view or not, YES by default
@property (nonatomic, assign) BOOL rounded;

/// Width of the border, 1 by default
@property (nonatomic, assign) CGFloat borderWidth;

/// color of the border, white by default
@property (nonatomic, assign) UIColor* borderColor;

/// color of the background of the switch view, clearColor by default
@property (nonatomic, strong) UIColor* color;

/// color of the background of the switch view when switched, clearColor by default
@property (nonatomic, strong) UIColor* tintColor;

/// width and height of the dot, frameHeight-2 by default
@property (nonatomic, assign) CGFloat dotWeight;

/// color of the dot, white by default
@property (nonatomic, strong) UIColor* dotColor;

/// duration of the animation, 0.6 by default
@property (nonatomic, assign) NSTimeInterval animDuration;

/// delegate to be set
@property (nonatomic, weak) id <CMSwitchViewDelegate> delegate;

/// set the switch YES or NO, with animation or not
- (void)setSelected:(BOOL)boolean animated:(BOOL)animated;

@end
