//
//  UIImage_AutoresizeTests.m
//  UIImage+AutoresizeTests
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "UIImage_SwizzleTestCase.h"

@interface UIImage (DynamicAutoresizeTests)

void logInfo(BOOL isVertical, CGFloat scale, CGFloat h, CGFloat w);

@end


@implementation UIImage_SwizzleTestCase

- (void)setUp {
    [super setUp];
	_scale = [UIScreen mainScreen].scale;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testShouldNotCrashOnLog {
	logInfo(true, 1, 12, 43);
	logInfo(false, 0, 2, 4.3);
}

- (UIImage *)imageNamed:(NSString *)name {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
}

- (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	return [UIImage imageNamed:imageName withTransitionSize:size inBundle:bundle];
}

@end
