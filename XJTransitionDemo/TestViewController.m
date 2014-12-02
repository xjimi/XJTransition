//
//  TestViewController.m
//  XJTransitionDemo
//
//  Created by jimi on 2014/12/2.
//  Copyright (c) 2014年 XJIMI. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.5];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(CGRectGetMaxX(self.view.bounds)-120, 20, 100, 50);
    [btn setTitle:@"Close" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action_close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)action_close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
