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

#pragma mark - Fake Image Name

- (void)testShouldReturnObjectFromValidName {
	UIImage *image = [self imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	if (_scale == 3.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@3x.png"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@".png"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@"@2x.png"] == false);
	} else if (_scale == 2.f) {
		XCTAssert([image.accessibilityIdentifier hasPrefix:@"test.bg"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@"@2x.png"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@"@3x.png"] == false);
	} else {
		XCTAssert([image.accessibilityIdentifier hasPrefix:@"test.bg"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@".png"]);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@"@2x.png"] == false);
		XCTAssert([image.accessibilityIdentifier hasSuffix:@"@3x.png"] == false);
	}
}

- (void)testShouldReturnObjectFromDotNameWithoutExtension {
	UIImage * image = [self imageNamed:@"test.bg"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg"]);
}

- (void)testShouldReturnObjectFromNameWithExtensionOrNilIfMissingAsset {
	UIImage * image = [self imageNamed:@"ressourcebg.png"];
	CGSize size = [UIScreen mainScreen].bounds.size;
	if (_scale == 2.f && size.height == 667.0f && size.width == 375.0f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"ressourcebg-667h@2x.png"]);
	} else {
		XCTAssertNil(image);
	}
}

- (void)testShouldReturnObjectFromNameWithoutExtension {
	UIImage * image = [self imageNamed:@"ressourcebg"];
	XCTAssertNil(image);
	XCTAssertNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnObjectFromNameWithScaleExtension {
	UIImage * image = [self imageNamed:@"test.bg@2x.png"];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@2x.png"]);

	image = [self imageNamed:@"test.bg@3x.png"];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@3x.png"]);
}

- (void)testShouldReturnObjectFromNameWithComplexExtension {
	UIImage * image = [self imageNamed:@"test.bg-375h-l@2x.png"];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-375h-l@2x.png"]);

	image = [self imageNamed:@"ressourcebg-667h@2x.png"];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"ressourcebg-667h@2x.png"]);
}

- (void)testShouldReturnDynamicImageNameWithoutSpecialSizeParameterGiven {
	NSString * dynamicImageName = [UIImage getDynamicImageName:@"test.bg@2x.png"];
	XCTAssertNotNil(dynamicImageName);
}

#pragma mark - Fake Image Name

- (void)testShouldReturnNilForInvalidImageName {
	UIImage * image = [self imageNamed:@"fakeImage.png"];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForInvalidImageNameAndExtension {
	UIImage * image = [self imageNamed:@"fakeImage@2x.png"];
	XCTAssertNil(image);
}

#pragma mark - invalid name

- (void)testShouldReturnNilForNilImageName {
	NSString *name = nil;
	UIImage * image = [self imageNamed:name];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForNSNullImageName {
	NSString *name = ((NSString *)[NSNull null]);
	UIImage * image = [self imageNamed:name];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForEmptyImageName {
	UIImage * image = [self imageNamed:@""];
	XCTAssertNil(image);
}

@end
