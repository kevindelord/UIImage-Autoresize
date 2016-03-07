//
//  XCTestCase+UIImage_VerticalExtensionTests.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 07/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "UIImage_SwizzleTestCase.h"

@interface UIImage_WithTransitionSizeTests : UIImage_SwizzleTestCase {
	CGFloat _scale;
}

@end

@implementation UIImage_WithTransitionSizeTests

- (void)setUp {
	[super setUp];
	_scale = [UIScreen mainScreen].scale;
}

- (void)testShouldReturnObjectFromDotNameWithHorizontalExtension {
	UIImage * image = [UIImage imageNamed:@"test.bg.png" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	if (_scale == 3.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-l@3x.png"]);
	} else if (_scale == 2.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-320h-l@2x.png"]);
	} else {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-l.png"]);
	}
}

- (void)testShouldReturnObjectFromDotNameWithVerticalExtension {
	UIImage * image = [UIImage imageNamed:@"test.bg.png" withTransitionSize:CGSizeMake(320.0f, 480.0f)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	if (_scale == 3.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@3x.png"]);
	} else if (_scale == 2.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@2x.png"]);
	} else {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg.png"]);
	}
}

- (void)testShouldReturnObjectFromDotNameWithoutExtension {
	UIImage * image = [UIImage imageNamed:@"test.bg" withTransitionSize:CGSizeMake(320.0f, 568.0f)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg"]);
}

- (void)testShouldReturnObjectFromNameWithExtension {
	UIImage * image = [UIImage imageNamed:@"ressourcebg.png" withTransitionSize:CGSizeMake(375.0f, 667.0f)];
	if (_scale == 3.f || _scale == 1.f) {
		XCTAssertNil(image);
	} else if (_scale == 2.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"ressourcebg-667h@2x.png"]);
	}
}

- (void)testShouldReturnObjectFromNameWithoutExtension {
	UIImage * image = [UIImage imageNamed:@"ressourcebg" withTransitionSize:CGSizeMake(375.0f, 667.0f)];
	XCTAssertNil(image);
	XCTAssertNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnObjectFromNameWithZeroTransitionSize {
	UIImage * image = [UIImage imageNamed:@"test.bg.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	if (_scale == 3.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@3x.png"]);
	} else {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg.png"]);
	}
}

- (void)testShouldReturnObjectFromNameWithExtensionAndZeroTransitionSize {
	UIImage * image = [UIImage imageNamed:@"test.bg@2x.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@2x.png"]);
}

- (void)testShouldReturnObjectFromNameWithComplexExtensionAndZeroTransitionSize {
	UIImage * image = [UIImage imageNamed:@"test.bg-375h-l@2x.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-375h-l@2x.png"]);
}

- (void)testShouldReturnObjectFromNameWithComplexExtensionAndValidTransitionSize {
	UIImage * image = [UIImage imageNamed:@"test.bg-375h-l@2x.png" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-375h-l@2x.png"]);
}


- (void)testShouldReturnNilForInvalidImageName {
	UIImage * image = [UIImage imageNamed:@"fake.test.bg" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForNilImageName {
	UIImage * image = [UIImage imageNamed:nil withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

@end


//CGFloat scale = [UIScreen mainScreen].scale;