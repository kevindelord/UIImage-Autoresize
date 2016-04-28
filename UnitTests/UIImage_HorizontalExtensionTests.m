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

+ (NSString *)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale;

@end

@interface UIImage_HorizontalExtensionTests : XCTestCase

@end

@implementation UIImage_HorizontalExtensionTests

#pragma mark - Invalid Parameters

- (void)testShouldReturnHorizontalSuffixForInvalidScale {
	// iPhone 3GS and earlier
	NSString * name = [UIImage horizontalExtensionForHeight:10 width:10 scale:0];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-l"]);
}

- (void)testShouldReturnHorizontalSuffixForInvalidHeight {
	// iPhone 3GS and earlier
	NSString * name = [UIImage horizontalExtensionForHeight:0 width:667 scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-l"]);
}

- (void)testShouldReturnHorizontalSuffixForInvalidWidth {
	// iPhone 3GS and earlier
	NSString * name = [UIImage horizontalExtensionForHeight:375 width:0 scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-l"]);
}

#pragma mark - Valid Parameters

- (void)testShouldReturnSuffixForiPhone6PlusStandardMode {
	// iPhone 6(S) Plus, Standard mode
	NSString * name = [UIImage horizontalExtensionForHeight:414.0f width:736.0f scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-l@3x"]);
}

- (void)testShouldReturnSuffixForiPhone6PlusZoomedMode {
	// iPhone 6(S) Plus Zoomed mode
	NSString * name = [UIImage horizontalExtensionForHeight:375.0f width:667.0f scale:3.f];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-375h-l@3x"]);
}

- (void)testShouldReturnSuffixForiPhone5 {
	// iPhone 5(S,C), iPhone 6(S) Zoomed mode
	NSString * name = [UIImage horizontalExtensionForHeight:320.0f width:568.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-320h-l@2x"]);
}

- (void)testShouldReturnSuffixForiPhone6StandardMode {
	// iPhone 6(S) Standard mode
	NSString * name = [UIImage horizontalExtensionForHeight:375.0f width:667.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-375h-l@2x"]);
}

- (void)testShouldReturnSuffixForiPhone4 {
	// iPhone 4(S)
	NSString * name = [UIImage horizontalExtensionForHeight:320.0f width:480.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-l@2x"]);
}

- (void)testShouldReturnSuffixForSmalliPads {
	// iPad Mini, iPad 2, iPad 1
	NSString * name = [UIImage horizontalExtensionForHeight:768.0f width:1024.0f scale:1];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-384h-l"]);
}

- (void)testShouldReturnSuffixForiPadAir {
	// iPad Mini 3, iPad Mini 2, iPad Air, iPad Air 2
	NSString * name = [UIImage horizontalExtensionForHeight:768.0f width:1024.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-768h-l@2x"]);
}

- (void)testShouldReturnSuffixForiPhonePro {
	// iPad Pro
	NSString * name = [UIImage horizontalExtensionForHeight:1024.0f width:1366.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-1024h-l@2x"]);
}

@end