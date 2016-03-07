//
//  ViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

#pragma mark - Life view cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: find a way to make the library loads the correct image when instanciated from a storyboard.
}

/**
 * In order to improve the flow and automatic image resize, the `imageView` is initialized once (in the storyboard)
 * but its image attribute is updated each time in the `viewWillAppear`.
 * This way when the interface orientation changes while a child view controller is presented, the main view controller
 * will be correct when shown again.
 */
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    self.imageView.image = [UIImage imageNamed:@"test.bg.png"];
}

#pragma mark - Rotation

/**
 * Update the current background image depending on the transition size.
 * Method used in iOS 8 and newer.
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    self.imageView.image = [UIImage imageNamed:@"test.bg.png" withTransitionSize:size];
}

/**
 * Update the current background image with the normal initialization method.
 * Method used until iOS 7.
 */
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    self.imageView.image = [UIImage imageNamed:@"test.bg.png"];
}

@end
