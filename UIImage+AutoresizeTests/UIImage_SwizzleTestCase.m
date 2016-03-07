//
//  UIImage_AutoresizeTests.m
//  UIImage+AutoresizeTests
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#import "UIImage_SwizzleTestCase.h"

@interface UIImage (DynamicAutoresizeTests)

+ (UIImage *)dynamicImageNamed:(NSString *)imageName;

@end


@implementation UIImage_SwizzleTestCase

- (void)setUp {
    [super setUp];
	Method origImageNamedMethod = class_getClassMethod(UIImage.class, @selector(imageNamed:));
	method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(UIImage.class, @selector(dynamicImageNamed:)));

	_scale = [UIScreen mainScreen].scale;
}

- (void)tearDown {
    [super tearDown];
	Method origImageNamedMethod = class_getClassMethod(UIImage.class, @selector(dynamicImageNamed:));
	method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(UIImage.class, @selector(imageNamed:)));
}

@end
