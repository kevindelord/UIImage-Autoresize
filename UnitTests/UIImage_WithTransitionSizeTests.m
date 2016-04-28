//
//  XCTestCase+UIImage_VerticalExtensionTests.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 07/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "UIImage_SwizzleTestCase.h"

@interface UIImage (AutoresizeTests)

+ (NSString *)verticalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale;
+ (NSString *)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale;

@end


@interface UIImage_WithTransitionSizeTests : UIImage_SwizzleTestCase

@end

@implementation UIImage_WithTransitionSizeTests

- (void)testShouldReturnObjectFromDotNameWithHorizontalExtension {
	CGFloat h = [UIScreen mainScreen].bounds.size.width;
	CGFloat w = [UIScreen mainScreen].bounds.size.height;

	UIImage *image = [self imageNamed:@"test.bg.png" withTransitionSize:CGSizeMake(w, h)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);

	NSString *extension = [UIImage horizontalExtensionForHeight:h width:w scale:_scale];
	NSString *finalFormat = [NSString stringWithFormat:@"test.bg%@.png", extension];
	XCTAssert([image.accessibilityIdentifier isEqualToString:finalFormat]);
}

- (void)testShouldReturnObjectFromDotNameWithVerticalExtension {
	CGFloat h = [UIScreen mainScreen].bounds.size.height;
	CGFloat w = [UIScreen mainScreen].bounds.size.width;

	UIImage *image = [self imageNamed:@"test.bg.png" withTransitionSize:CGSizeMake(w, h)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);

	NSString *extension = [UIImage verticalExtensionForHeight:h width:w scale:_scale];
	NSString *finalFormat = [NSString stringWithFormat:@"test.bg%@.png", extension];
	XCTAssert([image.accessibilityIdentifier isEqualToString:finalFormat]);
}

- (void)testShouldReturnObjectFromDotNameWithoutExtension {
	UIImage * image = [self imageNamed:@"test.bg" withTransitionSize:CGSizeMake(320.0f, 568.0f)];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg"]);
}

- (void)testShouldReturnObjectFromNameWithExtension {
	UIImage * image = [self imageNamed:@"ressourcebg.png" withTransitionSize:CGSizeMake(375.0f, 667.0f)];
	if (_scale == 3.f || _scale == 1.f) {
		XCTAssertNil(image);
	} else if (_scale == 2.f) {
		XCTAssert([image.accessibilityIdentifier isEqualToString:@"ressourcebg-667h@2x.png"]);
	}
}

- (void)testShouldReturnObjectFromNameWithoutExtension {
	UIImage * image = [self imageNamed:@"ressourcebg" withTransitionSize:CGSizeMake(375.0f, 667.0f)];
	XCTAssertNil(image);
	XCTAssertNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnObjectFromNameWithZeroTransitionSize {
	UIImage * image = [self imageNamed:@"test.bg.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg.png"]);
}

- (void)testShouldReturnObjectFromNameWithExtensionAndZeroTransitionSize {
	UIImage * image = [self imageNamed:@"test.bg@2x.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg@2x.png"]);
}

- (void)testShouldReturnObjectFromNameWithComplexExtensionAndZeroTransitionSize {
	UIImage * image = [self imageNamed:@"test.bg-375h-l@2x.png" withTransitionSize:CGSizeZero];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-375h-l@2x.png"]);
}

- (void)testShouldReturnObjectFromNameWithComplexExtensionAndValidTransitionSize {
	UIImage * image = [self imageNamed:@"test.bg-375h-l@2x.png" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNotNil(image);
	XCTAssert([image.accessibilityIdentifier isEqualToString:@"test.bg-375h-l@2x.png"]);
}

- (void)testShouldReturnNilForInvalidImageName {
	UIImage * image = [self imageNamed:@"fake.test.bg" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

#pragma mark - invalid name

- (void)testShouldReturnNilForNilImageName {
	UIImage * image = [self imageNamed:nil withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForNSNullImageName {
	NSString *name = ((NSString *)[NSNull null]);
	UIImage * image = [self imageNamed:name withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

- (void)testShouldReturnNilForEmptyImageName {
	UIImage * image = [self imageNamed:@"" withTransitionSize:CGSizeMake(568.0f, 320.0f)];
	XCTAssertNil(image);
}

@end
