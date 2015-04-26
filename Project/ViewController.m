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
    NSLog(@"%s", __FUNCTION__);
    // uncomment this and remove the picture in the storyboard to test a manual initialization
//    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

//- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    NSLog(@"%s", __FUNCTION__);
//}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%s", __FUNCTION__);
    

    self.imageView.image = [UIImage imageNamed:@"bg.png" withTransitionSize:size];

    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    CGFloat h = size.height;
//    CGFloat w = size.width;
//    CGFloat scale = [UIScreen mainScreen].scale;
//    NSLog(@"-------------------------------------");
//    NSLog(@"h: %f", h);
//    NSLog(@"w: %f", w);
//    NSLog(@"scale: %f", scale);
//    NSLog(@"-------------------------------------");

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    self.imageView.image = [UIImage imageNamed:@"bg.png" ];
}

@end
