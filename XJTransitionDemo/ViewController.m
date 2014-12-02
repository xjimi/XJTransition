//
//  ViewController.m
//  XJTransitionDemo
//
//  Created by jimi on 2014/12/2.
//  Copyright (c) 2014年 XJIMI. All rights reserved.
//

#import "ViewController.h"
#import "XJTransition.h"
#import "TestViewController.h"

@interface ViewController ()

@property (nonatomic, strong) XJTransition *transition;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transition = [[XJTransition alloc] init];
    self.transition.transitionDuration = 0.7f;
    self.transition.transitionDirection = XJTransitonDirectionBottom;
}

- (IBAction)action_show:(id)sender
{
    TestViewController *testVC = [[TestViewController alloc] init];    
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:testVC];
    navc.navigationBarHidden = YES;
    navc.modalPresentationStyle = UIModalPresentationCustom;
    navc.transitioningDelegate = self.transition;
    [self presentViewController:navc animated:YES completion:nil];
}

@end
