//
//  ThirdViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIImage+Autoresize.h"

@interface ThirdViewController () {
    UIImageView * _background;
}

@end

@implementation ThirdViewController

#pragma mark - Constraints

/**
 * Create and add constraints to make a child view match its parent frame.
 */
- (void)matchParentConstraints:(UIView *)parent child:(UIView *)child {
    [child setTranslatesAutoresizingMaskIntoConstraints:false];

    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeTop) multiplier:1 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeRight) multiplier:1 constant:0];

    [parent addConstraints:@[left, right, bottom, top]];
}

#pragma mark - Life view cycle

/**
 * This `ThirdViewController` is a test/proof that the library still works
 * when the imageView is instanciated from the code.
 * In order to improve the flow and automatic image resize, the `_background` is
 * initialized once and the image attribute updated each time the `viewWillAppear`
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.bg.png"]];
        [self.view addSubview:_background];
        [self.view sendSubviewToBack:_background];
        [self matchParentConstraints:self.view child:_background];
    } else {
        _background.image = [UIImage imageNamed:@"test.bg.png"];
    }
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

    _background.image = [UIImage imageNamed:@"test.bg.png" withTransitionSize:size];
}

/**
 * Update the current background image with the normal initialization method.
 * Method used until iOS 7.
 */
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    _background.image = [UIImage imageNamed:@"test.bg.png"];
}

@end
