//
//  UIImage_AutoresizeTests.m
//  UIImage+AutoresizeTests
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "UIImage_SwizzleTestCase.h"

@interface UIImage_AutoresizeTests : UIImage_SwizzleTestCase

@end

@implementation UIImage_AutoresizeTests

- (void)testShouldNotCrashOnSwizzling {

//	XCTAssertNil([UIImage dynamicImageNamed:@"test.bg.png"]);
////	XCTAssertNotNil([UIImage dynamicImageNamed:@"bg.png"]);
//	XCTAssertNil([UIImage dynamicImageNamed:@"bg"]);
//	XCTAssertNil([UIImage dynamicImageNamed:@"test.bg@3x.png"]);
	XCTAssertNotNil([UIImage dynamicImageNamed:@"test.bg@2x.png"]);
}

- (void)testShouldReturnInstanciatedImage {
	UIImage * image = [UIImage imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnInstanciatedImageWithExtension {
	UIImage * image = [UIImage imageNamed:@"test.bg@3x.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnInstanciatedImageWithAccessibilityIdentifier {
	UIImage * image = [UIImage imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnInstanciatedImageWithExtensionAndAccessibilityIdentifier {

	UIImage * image = [UIImage imageNamed:@"test.bg@3x.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
}

#pragma MARK: - Invalid Image Name

- (void)testShouldReturnNilForInvalidImageName {
	UIImage * image = [UIImage imageNamed:@"fakeImage.png"];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForInvalidImageNameAndExtension {
	UIImage * image = [UIImage imageNamed:@"fakeImage@2x.png"];
	XCTAssertNil(image);
}

@end
