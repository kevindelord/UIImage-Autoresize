//
//  UIImage+AutoresizeTests.h
//  UIImage+Autoresize
//
//  Created by kevin delord on 06/03/16.
//  Copyright © 2016 Smart Mobile Factory. All rights reserved.
//

#ifndef UIImage_AutoresizeTests_h
#define UIImage_AutoresizeTests_h

@interface UIImage (AutoresizeTests)

+ (NSString *)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w;
+ (NSString *)verticalExtensionForHeight:(CGFloat)h width:(CGFloat)w;

// The following functions can not be unit tested due to infinite loop.
+ (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size;
+ (UIImage *)dynamicImageNamedWithAccessibilityIdentifier:(NSString *)imageName;
+ (UIImage *)dynamicImageNamed:(NSString *)imageName;

@end

#endif /* UIImage_AutoresizeTests_h */
