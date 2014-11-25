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
    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
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
//    NSLog(@"-------------------------------------");
//    NSLog(@"didRotateFromInterfaceOrientation");
    self.imageView.image = [UIImage imageNamed:@"bg.png"];
}

@end
