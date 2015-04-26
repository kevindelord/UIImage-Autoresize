//
//  ViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // uncomment this and remove the picture in the storyboard to test a manual initialization
//    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    self.imageView.image = [UIImage imageNamed:@"bg.png" withTransitionSize:size];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    self.imageView.image = [UIImage imageNamed:@"bg.png" ];
}

@end
