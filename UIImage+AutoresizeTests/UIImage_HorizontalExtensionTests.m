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

+ (NSString *)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w;

@end

@interface UIImage_HorizontalExtensionTests : XCTestCase

@end

@implementation UIImage_HorizontalExtensionTests

- (void)testShouldReturnCorrectHorizontalExtension {
	NSString * image = [UIImage horizontalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

@end
