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

#pragma mark - Invalid Parameters

- (void)testShouldNotReturnSuffixForInvalidScale {
	// iPhone 3GS and earlier
	NSString * name = [UIImage verticalExtensionForHeight:10 width:10 scale:0];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@""]);
}

- (void)testShouldNotReturnSuffixForInvalidHeight {
	// iPhone 3GS and earlier
	NSString * name = [UIImage verticalExtensionForHeight:0 width:667 scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@""]);
}

- (void)testShouldNotReturnSuffixForInvalidWidth {
	// iPhone 3GS and earlier
	NSString * name = [UIImage verticalExtensionForHeight:375 width:0 scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@""]);
}

#pragma mark - Valid Parameters

- (void)testShouldReturnSuffixForiPhone6PlusStandardMode {
	// iPhone 6(S) Plus, Standard mode
	NSString * name = [UIImage verticalExtensionForHeight:736.0f width:414.0f scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"@3x"]);
}

- (void)testShouldReturnSuffixForiPhone6PlusZoomedMode {
	// iPhone 6(S) Plus Zoomed mode
	NSString * name = [UIImage verticalExtensionForHeight:667.0f width:375.0f scale:3];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-667h@3x"]);
}

- (void)testShouldReturnSuffixForiPhone5 {
	// iPhone 5(S,C), iPhone 6(S) Zoomed mode
	NSString * name = [UIImage verticalExtensionForHeight:568.0f width:320.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-568h@2x"]);
}

- (void)testShouldReturnSuffixForiPhone6StandardMode {
	// iPhone 6(S) Standard mode
	NSString * name = [UIImage verticalExtensionForHeight:667.0f width:375.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-667h@2x"]);
}

- (void)testShouldReturnSuffixForiPhone4 {
	// iPhone 4(S)
	NSString * name = [UIImage verticalExtensionForHeight:480.0f width:320.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"@2x"]);
}

- (void)testShouldReturnSuffixForiPads {
	// iPad Mini, iPad 2, iPad 1
	NSString * name = [UIImage verticalExtensionForHeight:1024.0f width:768.0f scale:1];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-512h"]);
}

- (void)testShouldReturnSuffixForiPhoneAir {
	// iPad Mini 3, iPad Mini 2, iPad Air, iPad Air 2
	NSString * name = [UIImage verticalExtensionForHeight:1024.0f width:768.0f scale:2];
	XCTAssertNotNil(name);
	XCTAssert([name isEqualToString:@"-1024h@2x"]);
}

@end
