//
//  CMSwitchView.m
//  brainapp
//
//  Created by Tom on 31/03/2015.
//  Copyright (c) 2015 Tom. All rights reserved.
//

#import "CMSwitchView.h"
@interface CMSwitchView()
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) UIView* switchView;
@property (nonatomic, strong) UIView* dotView;
@end
@implementation CMSwitchView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = nil;
        self.isSelected = NO;
        self.isRounded = YES;
        self.borderWidth = 1.f;
        self.borderColor = [UIColor whiteColor];
        self.color = [UIColor clearColor];
        self.tintColor = [UIColor clearColor];
        self.dotWeight = self.frame.size.height-10.f;
        self.dotColor = [UIColor whiteColor];
        self.animDuration = 0.6f;
        self.layer.masksToBounds = NO;
        
        self.switchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.switchView];
        
        self.dotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.dotWeight, self.dotWeight)];
        [self.dotView setBackgroundColor:self.dotColor];
        [self.switchView addSubview:self.dotView];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchClicked)];
        [self.switchView addGestureRecognizer:tap];
        
        UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureDetected:)];
        pan.delegate = self;
        [self.switchView addGestureRecognizer:pan];
    }
    return self;
}

- (void)setup {
    if (self.isRounded == YES) {
        [self.dotView.layer setCornerRadius:self.dotWeight/2];
        self.switchView.layer.cornerRadius = self.frame.size.height/2;
    }
    self.switchView.layer.borderColor = self.borderColor.CGColor;
    self.switchView.layer.borderWidth = self.borderWidth;
    self.switchView.backgroundColor = self.color;

    [self.dotView setFrame:CGRectMake(self.dotView.frame.origin.x, self.dotView.frame.origin.y, self.dotWeight, self.dotWeight)];
    
    [self.dotView setFrame:CGRectMake(self.frame.size.height/2-self.dotWeight/2, self.frame.size.height/2-self.dotWeight/2, self.dotWeight, self.dotWeight)];
    self.dotView.backgroundColor = self.dotColor;
}

- (void)panGestureDetected:(UIPanGestureRecognizer*)panGesture {
    CGPoint translation = [panGesture translationInView:self.switchView];

    if (((CGRectGetMidX(self.dotView.frame) + translation.x) >= self.frame.size.height/2) &&
        ((CGRectGetMidX(self.dotView.frame) + translation.x) <= self.frame.size.width-self.frame.size.height/2))
        [self.dotView setFrame:CGRectMake(self.dotView.frame.origin.x + translation.x, self.dotView.frame.origin.y, self.dotView.frame.size.width, self.dotView.frame.size.height)];
    
    if ((self.isSelected == NO && (CGRectGetMidX(self.dotView.frame) > self.frame.size.width/2)) ||
        (self.isSelected == YES && (CGRectGetMidX(self.dotView.frame) < self.frame.size.width/2))) {
        self.isSelected = !self.isSelected;
        if (self.delegate)
            [self.delegate switchValueChanged:self.isSelected];
    }
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        if (self.isSelected == NO && (CGRectGetMidX(self.dotView.frame) > self.frame.size.width/2)) {
            [self switchClicked];
        } else if (self.isSelected == NO && (CGRectGetMidX(self.dotView.frame) < self.frame.size.width/2)) {

            [UIView animateWithDuration:self.animDuration animations:^{
                [self.dotView setFrame:CGRectMake(self.frame.size.height/2-self.dotView.frame.size.width/2, self.dotView.frame.origin.y, self.dotView.frame.size.width, self.dotView.frame.size.height)];
                self.switchView.backgroundColor = self.color;
            }];
        } else if (self.isSelected == YES && (CGRectGetMidX(self.dotView.frame) < self.frame.size.width/2)) {
            [self switchClicked];
        } else if (self.isSelected == YES && (CGRectGetMidX(self.dotView.frame) > self.frame.size.width/2)) {
            [UIView animateWithDuration:self.animDuration animations:^{
                [self.dotView setFrame:CGRectMake((self.frame.size.width-self.frame.size.height/2)-self.dotView.frame.size.height/2, self.dotView.frame.origin.y, self.dotView.frame.size.width, self.dotView.frame.size.height)];
                self.switchView.backgroundColor = self.tintColor;
            }];
        }
    }
    [panGesture setTranslation:CGPointZero inView:self.switchView];
}

- (void)switchClicked {
    if (self.isSelected == YES) {
        self.isSelected = NO;
        [UIView animateWithDuration:self.animDuration animations:^{
            [self.dotView setFrame:CGRectMake(self.frame.size.height/2-self.dotView.frame.size.width/2, self.dotView.frame.origin.y, self.dotView.frame.size.width, self.dotView.frame.size.height)];
            self.switchView.backgroundColor = self.color;
        }];
        
    } else {
        self.isSelected = YES;
        [UIView animateWithDuration:self.animDuration animations:^{
            [self.dotView setFrame:CGRectMake(self.frame.size.width-self.frame.size.height/2-self.dotView.frame.size.width/2, self.dotView.frame.origin.y, self.dotView.frame.size.width, self.dotView.frame.size.height)];
            self.switchView.backgroundColor = self.tintColor;
        }];
    }
    if (self.delegate)
        [self.delegate switchValueChanged:self.isSelected];
}

@end
