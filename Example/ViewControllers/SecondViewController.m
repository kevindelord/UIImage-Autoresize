//
//  SecondViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/04/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "SecondViewController.h"
#import "UIImage+Autoresize.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

#pragma mark - Actions

/**
 * Pop the current view controller.
 */
- (IBAction)backAction:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
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
