//
//  ViewController.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 28/10/14.
//  Copyright (c) 2014 Smart Mobile Factory. All rights reserved.
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

@end
