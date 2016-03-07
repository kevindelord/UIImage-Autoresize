//
//  XCTestCase+UIImage_VerticalExtensionTests.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 07/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage_AutoresizeTests.h"

@interface UIImage_HorizontalExtensionTests : XCTestCase

@end

@implementation UIImage_HorizontalExtensionTests

- (void)testShouldReturnCorrectHorizontalExtension {
	NSString * image = [UIImage horizontalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

@end
