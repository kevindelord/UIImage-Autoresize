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
 * This function actually do the magic trick. When called for the first time it will swizzle (replace)
 * the normal methods with custom ones implemented in this library.
 * The `imageNamed:` and `imageNamed:inBundle:compatibleWithTraitCollection:` are swizzled.
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

#pragma mark - DEBUG Log Functions

/**
 *  Log information about the give scale and size.
 *
 *  @param isVertical Is the current device orientation vertical or not.
 *  @param scale      The natural scale factor associated with the screen.
 *  @param height     The height of the displayed screen in pixels.
 *  @param width      The width of the displayed screen in pixels.
 */
void logInfo(BOOL isVertical, CGFloat scale, CGFloat height, CGFloat width) {
	NSLog(@"---------------  %@  ----------------------", (isVertical == true ? @"VERTICAL" : @"HORIZONTAL"));
	NSLog(@"height: %f", height);
	NSLog(@"width: %f", width);
	NSLog(@"scale: %f", scale);
	NSLog(@"-------------------------------------------------");
}

#pragma mark - Suffix Name Convention

/**
 *  Returns a valid suffix string to use with a portrait/vertical image file.
 *
 *  @param h     The height of the displayed screen in pixels.
 *  @param w     The width of the displayed screen in pixels.
 *  @param scale The natural scale factor associated with the screen.
 *
 *  @return Image suffix name to match a valid portrait/vertical image file.
 */
+ (NSString * _Nonnull)verticalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale {

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
	} else if (scale == 3.f && h == 812.0f && w == 375.0f) {
		extension = @"-812h@3x";		// iPhone X
	}
    return extension;
}

/**
 *  Returns a valid suffix string to use with a landscape/horizontal image file.
 *
 *  @param h     The height of the displayed screen in pixels.
 *  @param w     The width of the displayed screen in pixels.
 *  @param scale The natural scale factor associated with the screen.
 *
 *  @return Image suffix name to match a valid landscape/horizontal image file.
 */
+ (NSString * _Nonnull)horizontalExtensionForHeight:(CGFloat)h width:(CGFloat)w scale:(CGFloat)scale {

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
	} else if (scale == 3.f && w == 812.0f && h == 375.0f) {
		extension = @"-375h-X-l@3x";		// iPhone X
	}
	return extension;
}

#pragma mark - Image Named swizzled functions

/**
 *  Returns the image object associated with a dynamic filename.
 *
 *  The filename is improved depending on the current device size and orientation to
 *  return an image that perfectly matches the device's screen.
 *
 *  The app's main bundle and the trait collection associated with the main screen are used.
 *
 *  Returns an UIImage object.
 */
+ (UIImage * _Nullable)dynamicImageNamed:(NSString * _Nonnull)imageName {
	return [self imageNamed:imageName inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
}

/**
 *  Returns the image object associated with a dynamic filename from a given bundle and with compatible trait collection.
 *
 *  This function calculates the required CGSize with which the UIImage should depend from.
 *  This size is then used to get the correct suffix of the image filename.
 *
 *  If specified, the named image also needs to be compatible with the specified trait collection. If no suitable image was found the function returns nil.
 *
 *  @param imageName       The name of the image. For images in asset catalogs, specify the name of the image asset. For PNG image files, specify the filename without the filename extension. For all other image file formats, include the filename extension in the name.
 *  @param bundle          The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 *
 *  @return The image object that best matches the desired traits with a dynamic name, or nil if no suitable image was found.
 */
+ (UIImage * _Nullable)dynamicImageNamed:(NSString * _Nonnull)imageName inBundle:(NSBundle * _Nullable)bundle compatibleWithTraitCollection:(UITraitCollection * _Nullable)traitCollection {
	// Verification step
	if ([self isImageNameValid:imageName] == false) {
		return nil;
	}
	bundle = (bundle != nil ? bundle : [NSBundle mainBundle]);
	// Only change the name if no '@2x' or '@3x' are specified
	if ([imageName rangeOfString:@"@"].location == NSNotFound) {

		return [self imageNamed:imageName withTransitionSize:self.screenSize inBundle:bundle compatibleWithTraitCollection:traitCollection];
	}

	// Otherwise returns an UIImage with the original filename.
	return [UIImage dynamicImageNamedWithAccessibilityIdentifier:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
}

#pragma mark - Orientation change functions

/**
 *  Returns a new UIImage object created from a filename and a required transition Size.
 *
 *  @discussion This function should be called from a view controller when the device changes its orientation.
 *  The function `viewWillTransitionToSize:withTransitionCoordinator:` is only available from iOS 8.
 *
 *  The app's main bundle and the trait collection associated with the main screen are used.
 *
 *  @param imageName The NSString object representing the filename of the image.
 *  @param size      The new size for the container’s view.
 *
 *  @return An UIImage created from a generated string name.
 */
+ (UIImage * _Nullable)imageNamed:(NSString * _Nonnull)imageName withTransitionSize:(CGSize)size {
	return [self imageNamed:imageName withTransitionSize:size inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
}

/**
 *  Returns a new UIImage object created from a filename and a required transition Size from a specific bundle.
 *
 *  @param imageName The NSString object representing the filename of the image.
 *  @param size      The new size for the container’s view.
 *  @param bundle    The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *
 *  @return An UIImage created from a generated string name within a specific bundle.
 */
+ (UIImage * _Nullable)imageNamed:(NSString * _Nonnull)imageName withTransitionSize:(CGSize)size inBundle:(NSBundle * _Nullable)bundle {
	return [self imageNamed:imageName withTransitionSize:size inBundle:bundle compatibleWithTraitCollection:nil];
}

/**
 *  Returns a new UIImage object created from a filename and a required transition Size from a specific bundle.
 *
 *  @param imageName       The NSString object representing the filename of the image.
 *  @param size            The new size for the container’s view.
 *  @param bundle          The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 *
 *  @return An UIImage created from a generated string name within a specific bundle.
 */
+ (UIImage * _Nullable)imageNamed:(NSString * _Nonnull)imageName withTransitionSize:(CGSize)size inBundle:(NSBundle * _Nullable)bundle compatibleWithTraitCollection:(UITraitCollection * _Nullable)traitCollection {
	// Verification step
	if ([self isImageNameValid:imageName] == false) {
		return nil;
	}
	bundle = (bundle != nil ? bundle : [NSBundle mainBundle]);
	// Only change the name if no '@2x' or '@3x' are specified
	if ([imageName rangeOfString:@"@"].location == NSNotFound) {

		NSString *dynamicImageName = [self getDynamicImageName:imageName size:size];

		// If exist returns the corresponding UIImage
		if ([bundle pathForResource:dynamicImageName ofType:@""]) {
			return [UIImage dynamicImageNamedWithAccessibilityIdentifier:dynamicImageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
		}
	}
	// Otherwise returns an UIImage with the original filename.
	return [UIImage dynamicImageNamedWithAccessibilityIdentifier:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
}

#pragma mark - Utilities

/**
 *  Instanciate an UIImage object given a specific filename and set the `accessibilityIdentifier` to the same image name.
 *
 *	By default, the accessibility identifier will now always be set to the image filename.
 *
 *  @param imageName       The NSString object representing the filename of the image. This value will also be set as the accessibility identifier of the element.
 *  @param bundle          The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 *
 *  @return An UIImage object with its image filename set as accessibility identifier.
 */
+ (UIImage * _Nullable)dynamicImageNamedWithAccessibilityIdentifier:(NSString * _Nonnull)imageName inBundle:(NSBundle * _Nullable)bundle compatibleWithTraitCollection:(UITraitCollection * _Nullable)traitCollection {
	UIImage *finalImage = [UIImage dynamicImageNamed:imageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
	finalImage.accessibilityIdentifier = imageName;
	return finalImage;
}

/**
 *  Check wether a given file name is valid or not.
 *
 *  @param imageName NSString object representing the image filename.
 *
 *  @return TRUE if the filename is valid; FALSE otherwise.
 */
+ (BOOL)isImageNameValid:(NSString * _Nonnull)imageName {
	if (imageName == nil || ([imageName isKindOfClass:[NSString class]] == false)) {
		return false;
	}
	if (imageName != nil && ([imageName isKindOfClass:[NSString class]] == true) && imageName.length == 0) {
		return false;
	}
	return true;
}

/**
 * Returns the screen size of the applications UIScreen
 *
 *@return the screen size of the applications UIScreen
 */
+ (CGSize)screenSize {
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
	return size;
}

/**
 *  Returns the dynamic image name for the given image name.
 *
 *  @param imageFilename The original filename to which the extension should be added.
 *
 *  @return The dynamic filename which includes the screen depending extension.
 */
+ (NSString * _Nonnull)getDynamicImageName:(NSString * _Nonnull)imageFilename {
	return [self getDynamicImageName:imageFilename size:self.screenSize];
}

/**
 *  Returns the dynamic image name for the given image name.
 *
 *  @param imageFilename The original filename to which the extension should be added.
 *  @param size			 The size of the screen.
 *
 *  @return The dynamic filename which includes the screen depending extension.
 */
+ (NSString * _Nonnull)getDynamicImageName:(NSString * _Nonnull)imageFilename size:(CGSize)size {
	// Create the extension
	NSString *extension = @"";
	if (size.height >= size.width) {
		extension = [self verticalExtensionForHeight:size.height width:size.width scale:[UIScreen mainScreen].scale];
	} else {
		extension = [self horizontalExtensionForHeight:size.height width:size.width scale:[UIScreen mainScreen].scale];
	}
	// Add a custom extension to the image name
	NSRange dot = [imageFilename rangeOfString:@"." options:NSBackwardsSearch];
	NSMutableString *imageNameMutable = [imageFilename mutableCopy];
	if (dot.location != NSNotFound) {
		[imageNameMutable insertString:extension atIndex:dot.location];
	} else {
		[imageNameMutable appendString:extension];
	}
	return imageNameMutable;
}

@end

@implementation UIImageView (Autoresize)

/**
 *  Update the image of the current image view with an image object associated to the given dynamic filename.
 *
 *  The filename is improved depending on the current device size and orientation to return an image that perfectly matches the device's screen.
 *
 *  The app's main bundle and the trait collection associated with the main screen are used.
 *
 *  @param dynamicImageName The dynamic image name set in the storyboard.
 */
- (void)setDynamicImageName:(NSString * _Nonnull)dynamicImageName {
	[self setDynamicImageName:dynamicImageName inBundle:nil compatibleWithTraitCollection:nil];
}

/**
 *  Update the image of the current image view with an image object associated to the given dynamic filename from a specific bundle.
 *
 *  The filename is improved depending on the current device size and orientation to return an image that perfectly matches the device's screen.
 *
 *  @param dynamicImageName The NSString object representing the filename of the image. This value will also be set as the accessibility identifier of the element.
 *  @param bundle           The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection  The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 */
- (void)setDynamicImageName:(NSString * _Nonnull)dynamicImageName inBundle:(NSBundle * _Nullable)bundle compatibleWithTraitCollection:(UITraitCollection * _Nullable)traitCollection {
	self.image = [UIImage imageNamed:dynamicImageName inBundle:bundle compatibleWithTraitCollection:traitCollection];
}

/**
 *  Returns the accessibility identifier of the image object of the current image view.
 *
 *  @return A NSString object that identifies the image element; nil if none set or if no image.
 */
- (NSString * _Nullable)dynamicImageName {
	return self.image.accessibilityIdentifier;
}

@end
