//
//  UIImage_AutoresizeTests.m
//  UIImage+AutoresizeTests
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImage+Autoresize.h"
//#import "UIImage+AutoresizeTests.h"

@interface UIImage_AutoresizeTests : XCTestCase

@end

@implementation UIImage_AutoresizeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
	UIImage * image = [UIImage imageNamed:@"test.bg.png"];
	XCTAssertNotNil(image);
}

- (void)testShouldReturnCorrectVerticalExtension {
	NSString * image = [UIImage verticalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

- (void)testShouldReturnCorrectHorizontalExtension {
	NSString * image = [UIImage horizontalExtensionForHeight:10 width: 10];
	XCTAssertNotNil(image);
}

@end
