//
//  UIImage+Autoresize.m
//  UIImage+Autoresize
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#import "UIImage+Autoresize.h"
#import <objc/runtime.h>

#define __K_DEBUG_LOG_UIIMAGE_AUTORESIZE_ENABLED__      false

@implementation UIImage (Autoresize)

#pragma mark - UIImage Initializer

/**
 * This function actually do the magic trick. When called for the first time it will swizz (replace)
 * the normal methods with custom ones implemented in this library.
 * The `imageNamed:` and `imageNamed:inBundle:compatibleWithTraitCollection:` are changed.
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
		// Method: `imageNamed:`
        Method origImageNamedMethod = class_getClassMethod(self.class, @selector(imageNamed:));
        method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(self.class, @selector(dynamicImageNamed:)));
		// Method: `imageNamed:inBundle:compatibleWithTraitCollection:`
		Method origImageNamedInBundleMethod = class_getClassMethod(self.class, @selector(imageNamed:inBundle:compatibleWithTraitCollection:));
		method_exchangeImplementations(origImageNamedInBundleMethod, class_getClassMethod(self.class, @selector(dynamicImageNamed:inBundle:compatibleWithTraitCollection:)));
    });
}

/**
 * Log information about the give scale and size.
 */
void logInfo(BOOL isVertical, CGFloat scale, CGFloat h, CGFloat w) {
	NSLog(@"---------------  %@  ----------------------", (isVertical == true ? @"VERTICAL" : @"HORIZONTAL"));
	NSLog(@"h: %f", h);
	NSLog(@"w: %f", w);
	NSLog(@"scale: %f", scale);
	NSLog(@"-------------------------------------------------");
}

/**
 * Returns a valid suffix string to use with a portrait/vertical image file.
 * It takes as parameters the desired height and witdh of the screen.
 */
+ (NSString *)verticalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale {

    if (__K_DEBUG_LOG_UIIMAGE_AUTORESIZE_ENABLED__) {
		logInfo(true, scale, h, w);
    }

    // Generate the current valid file extension depending on the current device screen size.
    NSString *extension = @"";      // iPhone 3GS and earlier
    if (scale == 3.f && h == 736.0f && w == 414.0f) {
        extension = @"@3x";         // iPhone 6(S) Plus Standard mode
    } else if (scale == 3.f && h == 667.0f && w == 375.0f) {
        extension = @"-667h@3x";    // iPhone 6(S) Plus Zoomed mode
    } else if (scale == 2.f && h == 568.0f && w == 320.0f) {
        extension = @"-568h@2x";    // iPhone 5(S,C), iPhone 6(S) Zoomed mode
    } else if (scale == 2.f && h == 667.0f && w == 375.0f) {
        extension = @"-667h@2x";    // iPhone 6(S) Standard mode
    } else if (scale == 2.f && h == 480.0f && w == 320.0f) {
        extension = @"@2x";         // iPhone 4(S)
    } else if (scale == 1.f && h == 1024.0f && w == 768.0f) {
        extension = @"-512h";       // iPad Mini, iPad 2, iPad 1
    } else if (scale == 2.f && h == 1024.0f && w == 768.0f) {
        extension = @"-1024h@2x";   // iPad Mini 3, iPad Mini 2, iPad Air, iPad Air 2
	} else if (scale == 2.f && h == 1366.0f && w == 1024.0f) {
		extension = @"-1366h@2x";	// iPad Pro
	}
    return extension;
}

/**
 * Returns a valid suffix string to use with a landscape/horizontal image file.
 * It takes as parameters the desired height and witdh of the screen.
 */
+ (NSString *)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale {

    if (__K_DEBUG_LOG_UIIMAGE_AUTORESIZE_ENABLED__) {
		logInfo(false, scale, h, w);
    }

    // Generate the current valid file extension depending on the current device screen size.
    NSString *extension = @"-l";    // iPhone 3GS and earlier
    if (scale == 3.f && w == 736.0f && h == 414.0f) {
        extension = @"-l@3x";       // iPhone 6(S) Plus Standard mode
    } else if (scale == 3.f && w == 667.0f && h == 375.0f) {
        extension = @"-375h-l@3x";  // iPhone 6(S) Plus Zoomed mode
    } else if (scale == 2.f && w == 568.0f && h == 320.0f) {
        extension = @"-320h-l@2x";  // iPhone 5(S,C), iPhone 6(S) Zoomed mode
    } else if (scale == 2.f && w == 667.0f && h == 375.0f) {
        extension = @"-375h-l@2x";  // iPhone 6(S) Standard Standard mode
    } else if (scale == 2.f && w == 480.0f && h == 320.0f) {
        extension = @"-l@2x";       // iPhone 4(S)
    } else if (scale == 1.f && w == 1024.0f && h == 768.0f) {
        extension = @"-384h-l";     // iPad Mini, iPad 2, iPad 1
    } else if (scale == 2.f && w == 1024.0f && h == 768.0f) {
        extension = @"-768h-l@2x";  // iPad Mini 3, iPad Mini 2, iPad Air, iPad Air 2
	} else if (scale == 2.f && w == 1366.0f && h == 1024.0f) {
		extension = @"-1024h-l@2x"; // iPad Pro
	}
	return extension;
}

/**
 * This function calculates the required CGSize with which the UIImage should depend from.
 * This size is then use to get the correct suffix of the image filename.
 *
 * The main bundle is used.
 *
 * Returns an UIImage object.
 */
+ (UIImage *)dynamicImageNamed:(NSString *)imageName {
	return [self imageNamed:imageName inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
}

/**
 *  Returns the named image that is also compatible with the specified trait collection.
 *
 *  The image object that best matches the desired traits with the given name, or nil if no suitable image was found.
 *
 *  @param imageName       The name of the image. For images in asset catalogs, specify the name of the image asset. For PNG image files, specify the filename without the filename extension. For all other image file formats, include the filename extension in the name.
 *  @param bundle          The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 *
 *  @return The image object that best matches the desired traits with the given name, or nil if no suitable image was found.
 */
+ (UIImage *)dynamicImageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection {
	// Verification step
	if ([self isImageNameValid:imageName] == false) {
		return nil;
	}

	// Only change the name if no '@2x' or '@3x' are specified
	if ([imageName rangeOfString:@"@"].location == NSNotFound) {

		UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
		CGSize size = [UIScreen mainScreen].bounds.size;
		//
		// Before iOS 8.0 the current mainScreen bounds were giving a different result than with newest iOS version.
		// The size needs to be reversed for landscape mode.
		if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
			if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
				CGFloat temp = size.width;
				size.width = size.height;
				size.height = temp;
			}
		}
		return [self imageNamed:imageName withTransitionSize:size inBundle:bundle compatibleWithTraitCollection:traitCollection];
	}

	// Otherwise returns an UIImage with the original filename.
	return [UIImage dynamicImageNamedWithAccessibilityIdentifier:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
}

/**
 * When given a valid name and a transition size as parameters, this function will generate a new filename with a required suffix.
 * This filename is used to create and return a new UIImage object.
 */
+ (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size {
	return [self imageNamed:imageName withTransitionSize:size inBundle:[NSBundle mainBundle]];
}

// TODO: doc
+ (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size inBundle:(NSBundle *)bundle {
	return [self imageNamed:imageName withTransitionSize:size inBundle:bundle compatibleWithTraitCollection:nil];
}

+ (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection {
	// Verification step
	if ([self isImageNameValid:imageName] == false) {
		return nil;
	}

	// Only change the name if no '@2x' or '@3x' are specified
	if ([imageName rangeOfString:@"@"].location == NSNotFound) {

		NSString *extension = @"";
		if (size.height >= size.width) {
			extension = [self verticalExtensionForHeight:size.height width:size.width scale:[UIScreen mainScreen].scale];
		} else {
			extension = [self horizontalExtensionForHeight:size.height width:size.width scale:[UIScreen mainScreen].scale];
		}

		// Add a custom extension to the image name
		NSRange dot = [imageName rangeOfString:@"." options:NSBackwardsSearch];
		NSMutableString *imageNameMutable = [imageName mutableCopy];
		if (dot.location != NSNotFound) {
			[imageNameMutable insertString:extension atIndex:dot.location];
		} else {
			[imageNameMutable appendString:extension];
		}
		// If exist returns the corresponding UIImage
		if ([bundle pathForResource:imageNameMutable ofType:@""]) {
			return [UIImage dynamicImageNamedWithAccessibilityIdentifier:imageNameMutable inBundle:bundle compatibleWithTraitCollection:traitCollection];
		}
	}
	// Otherwise returns an UIImage with the original filename.
	return [UIImage dynamicImageNamedWithAccessibilityIdentifier:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
}

/**
 * Instanciate an UIImage object given a specific filename and set the `accessibilityIdentifier` to the same image name.
 *
 * After that, it will be possible to get the filename used at runtime for a dedicated UIImage object.
 */
+ (UIImage *)dynamicImageNamedWithAccessibilityIdentifier:(NSString *)imageName inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection {
	UIImage *finalImage = [UIImage dynamicImageNamed:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
	finalImage.accessibilityIdentifier = imageName;
	return finalImage;
}

/**
 *  Check wether a given file name is valid or not.
 */
+ (BOOL)isImageNameValid:(NSString *)imageName {
	if (imageName == nil || ([imageName isKindOfClass:[NSString class]] == false)) {
		return false;
	}
	if (imageName != nil && ([imageName isKindOfClass:[NSString class]] == true) && imageName.length == 0) {
		return false;
	}
	return true;
}

@end
