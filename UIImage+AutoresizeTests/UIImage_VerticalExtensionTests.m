//
//  XCTestCase+UIImage_VerticalExtensionTests.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 07/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage+Autoresize.h"

@interface UIImage (AutoresizeTests)

+ (NSString *)verticalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale;

@end

@interface UIImage_VerticalExtensionTests : XCTestCase

@end

@implementation UIImage_VerticalExtensionTests

- (void)testShouldReturnCorrectVerticalExtension {
	// TODO: full tests
	NSString * image = [UIImage verticalExtensionForHeight:10 width:10 scale:1];
	XCTAssertNotNil(image);
}

@end
