//
//  ViewController.m
//  CMSwitchViewExample
//
//  Created by Tom on 05/04/2015.
//  Copyright (c) 2015 Tom. All rights reserved.
//
#import "CMSwitchView.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CMSwitchView* firstSwitch;
@property (nonatomic, strong) CMSwitchView* secondSwitch;
@property (nonatomic, strong) CMSwitchView* thirdSwitch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"VUE");
    self.view.backgroundColor = [UIColor blackColor];
    
    self.firstSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-150, 100, 300, 50)];
    self.firstSwitch.dotColor = [UIColor blueColor];
    self.firstSwitch.color = [UIColor whiteColor];
    self.firstSwitch.tintColor = [UIColor clearColor];
    [self.firstSwitch setup];
    [self.view addSubview:self.firstSwitch];
    
    self.secondSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-100, self.firstSwitch.frame.size.height+self.firstSwitch.frame.origin.y+100, 200, 60)];
    self.secondSwitch.dotColor = [UIColor whiteColor];
    self.secondSwitch.color = [UIColor clearColor];
    self.secondSwitch.tintColor = [UIColor clearColor];
    self.secondSwitch.dotWeight = 20.f;
    [self.secondSwitch setup];
    [self.view addSubview:self.secondSwitch];
    
    self.thirdSwitch = [[CMSwitchView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.secondSwitch.frame.size.height+self.secondSwitch.frame.origin.y+100, 100, 30)];
    self.thirdSwitch.animDuration = 2.f;
    self.thirdSwitch.isRounded = NO;
    [self.thirdSwitch setup];
    [self.view addSubview:self.thirdSwitch];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
