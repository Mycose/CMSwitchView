//
//  CMSwitchView.h
//  brainapp
//
//  Created by Tom on 31/03/2015.
//  Copyright (c) 2015 Tom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMSwitchViewDelegate <NSObject>
- (void)switchValueChanged:(BOOL)value;
@end

@interface CMSwitchView : UIView<UIGestureRecognizerDelegate>
@property (nonatomic, assign) BOOL isRounded;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor* borderColor;
@property (nonatomic, strong) UIColor* color;
@property (nonatomic, strong) UIColor* tintColor;
@property (nonatomic, assign) CGFloat dotWeight;
@property (nonatomic, strong) UIColor* dotColor;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) id<CMSwitchViewDelegate> delegate;
- (void)setup;
@end
