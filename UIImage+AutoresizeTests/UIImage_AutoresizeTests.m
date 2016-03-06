//
//  UIImage_AutoresizeTests.m
//  UIImage+AutoresizeTests
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage_AutoresizeTests.h"
#import <objc/runtime.h>

@interface UIImage_AutoresizeTests : XCTestCase

@end

@implementation UIImage_AutoresizeTests

+ (UIImage *)localTestImageNamedWithAccessibilityIdentifier:(NSString *)imageName {
	// TODO: remove?
	return nil;
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testShouldNotCrashOnSwizzling {

//	// TODO: explanation + isolate ?

//	Method origImageNamedMethod = class_getClassMethod(UIImage.class, @selector(dynamicImageNamedWithAccessibilityIdentifier:));
//	method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(self.class, @selector(localTestImageNamedWithAccessibilityIdentifier:)));
//
//	XCTAssertNil([UIImage dynamicImageNamed:@"test.bg.png"]);
////	XCTAssertNotNil([UIImage dynamicImageNamed:@"bg.png"]);
//	XCTAssertNil([UIImage dynamicImageNamed:@"bg"]);
//	XCTAssertNil([UIImage dynamicImageNamed:@"test.bg@3x.png"]);
//	XCTAssertNil([UIImage dynamicImageNamed:@"bg@2x.png"]);
}

- (void)testShouldReturnInstanciatedImage {
	UIImage * image = [UIImage imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
}

- (void)testShouldReturnInstanciatedImageWithAccessibilityIdentifier {

	// TODO: explanation + isolate ?
	Method origImageNamedMethod = class_getClassMethod(UIImage.class, @selector(imageNamed:));
	method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(UIImage.class, @selector(dynamicImageNamed:)));

	UIImage * image = [UIImage imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
	XCTAssertNotNil(image.accessibilityIdentifier);
}

- (void)testShouldReturnNilForInvalidImageName {
	UIImage * image = [UIImage imageNamed:@"fakeImage.png"];
	XCTAssertNil(image);
}

- (void)testShouldReturnCorrectVerticalExtension {
	// TODO: full tests
	NSString * image = [UIImage verticalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

- (void)testShouldReturnCorrectHorizontalExtension {
	NSString * image = [UIImage horizontalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

@end
