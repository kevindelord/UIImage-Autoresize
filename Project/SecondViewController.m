//
//  SecondViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () {
    UIImageView * _background;
}

@end

@implementation SecondViewController

- (void)matchParentConstraints:(UIView *)parent child:(UIView *)child {
    [child setTranslatesAutoresizingMaskIntoConstraints:false];

    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeBottom) multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeTop) multiplier:1 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeLeft) multiplier:1 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:child attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:parent attribute:(NSLayoutAttributeRight) multiplier:1 constant:0];

    [parent addConstraints:@[left, right, bottom, top]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
        [self matchParentConstraints:self.view child:_background];
        [self.view addSubview:_background];
        [self.view sendSubviewToBack:_background];
    } else {
        _background.image = [UIImage imageNamed:@"bg.png"];
    }
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%s", __FUNCTION__);
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    _background.image = [UIImage imageNamed:@"bg.png" withTransitionSize:size];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    _background.image = [UIImage imageNamed:@"bg.png"];
}

@end
