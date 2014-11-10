//
//  SecondViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGRect screenRect = [[UIScreen mainScreen] bounds];

    UIImageView *background = [[UIImageView alloc] init];
    background.frame = CGRectMake(0,0,screenRect.size.width,screenRect.size.height);
    background.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];

    UITextView *histView = [[UITextView alloc] init];
    histView.frame = CGRectMake(0, 100, screenRect.size.width ,screenRect.size.height);
    histView.editable = NO;
    histView.backgroundColor = [UIColor clearColor];
    histView.font = [UIFont fontWithName:@"Verdana" size:15];
    histView.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    histView.scrollEnabled = YES;
    [histView setDataDetectorTypes:UIDataDetectorTypeAll];
    histView.textColor = [UIColor whiteColor];
    [self.view addSubview:histView];
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
