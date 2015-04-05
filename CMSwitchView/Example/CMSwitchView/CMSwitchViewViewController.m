//
//  CMSwitchViewViewController.m
//  CMSwitchView
//
//  Created by Mycose on 04/05/2015.
//  Copyright (c) 2014 Mycose. All rights reserved.
//
#import <CMSwitchView.h>
#import "CMSwitchViewViewController.h"

@interface CMSwitchViewViewController ()
@property (nonatomic, strong) CMSwitchView* firstSwitch;
@property (nonatomic, strong) CMSwitchView* secondSwitch;
@property (nonatomic, strong) CMSwitchView* thirdSwitch;
@end

@implementation CMSwitchViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.firstSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-150, 100, 300, 50)];
    self.firstSwitch.dotColor = [UIColor blueColor];
    self.firstSwitch.color = [UIColor whiteColor];
    self.firstSwitch.tintColor = [UIColor clearColor];
    [self.view addSubview:self.firstSwitch];
    
    self.secondSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-100, self.firstSwitch.frame.size.height+self.firstSwitch.frame.origin.y+100, 200, 60)];
    self.secondSwitch.dotColor = [UIColor whiteColor];
    self.secondSwitch.color = [UIColor clearColor];
    self.secondSwitch.tintColor = [UIColor clearColor];
    self.secondSwitch.dotWeight = 20.f;
    [self.view addSubview:self.secondSwitch];
    
    self.thirdSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.secondSwitch.frame.size.height+self.secondSwitch.frame.origin.y+100, 100, 30)];
    self.thirdSwitch.animDuration = 0.1f;
    self.thirdSwitch.rounded = NO;
    self.thirdSwitch.borderColor = [UIColor redColor];
    self.thirdSwitch.dotColor = [UIColor redColor];
    self.thirdSwitch.color = [UIColor whiteColor];
    [self.view addSubview:self.thirdSwitch];
}

@end
