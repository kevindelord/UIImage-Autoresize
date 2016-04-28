//
//  UIImage+Autoresize.h
//  UIImage+Autoresize
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 Kevin Delord. All rights reserved.
//

#ifndef UIImage_Autoresize_h__
#define UIImage_Autoresize_h__

#import <UIKit/UIKit.h>

//! Project version number for UIImageAutoresize.
FOUNDATION_EXPORT double UIImageAutoresizeVersionNumber;

//! Project version string for UIImageAutoresize.
FOUNDATION_EXPORT const unsigned char UIImageAutoresizeVersionString[];

/**
 *  Category of the UIImage class replacing the default `UIImage::imageNamed:` method with a custom one.
 *  Mainly used for fullscreen background images, this class adds a naming convention to deal image assets
 *  with different sizes, orientations and scales.
 *
 *  The suffixes are describe in the `README.md`.
 */
@interface UIImage (Autoresize)

#pragma mark - UIImage Initializer

/**
 *  Method to override the `UIImage` initializer methods with custom ones.
 *  The new methods and their implementation will be executed instead of the default one.
 *  The user don't need to do anything.
 *  The `imageNamed:` and `imageNamed:inBundle:compatibleWithTraitCollection:` are swizzled.
 */
+ (void)load NS_AVAILABLE_IOS(2.0);

/**
 *  Returns a new UIImage object created from a filename and a required transition Size.
 *
 *  @discussion This function should be called from a view controller when the device changes its orientation.
 *  The function `viewWillTransitionToSize:withTransitionCoordinator:` is only available from iOS 8.
 *
 *  The app's main bundle is used.
 *
 *  @param imageName The NSString object representing the filename of the image.
 *  @param size      The new size for the container’s view.
 *
 *  @return An UIImage created from a generated string name.
 */
+ (UIImage * _Nullable)imageNamed:(NSString * _Nonnull)imageName withTransitionSize:(CGSize)size NS_AVAILABLE_IOS(8.0);

/**
 *  Returns a new UIImage object created from a filename and a required transition Size from a specific bundle.
 *
 *  @param imageName The NSString object representing the filename of the image.
 *  @param size      The new size for the container’s view.
 *  @param bundle    The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *
 *  @return An UIImage created from a generated string name within a specific bundle.
 */
+ (UIImage * _Nullable)imageNamed:(NSString * _Nonnull)imageName withTransitionSize:(CGSize)size inBundle:(NSBundle * _Nullable)bundle NS_AVAILABLE_IOS(8.0);

@end

/**
 * Category of the UIImageView class to use the user defined runtime attributes to set the dynamic image.
 */
@interface UIImageView (Autoresize)

/**
 *  Update the image of the current image view with an image object associated to the given dynamic filename.
 *
 *  The filename is improved depending on the current device size and orientation to return an image that perfectly matches the device's screen.
 *
 *  The app's main bundle and the trait collection associated with the main screen are used.
 *
 *  @param dynamicImageName The dynamic image name set in the storyboard.
 */
- (void)setDynamicImageName:(NSString * _Nonnull)dynamicImageName;

/**
 *  Update the image of the current image view with an image object associated to the given dynamic filename from a specific bundle.
 *
 *  The filename is improved depending on the current device size and orientation to return an image that perfectly matches the device's screen.
 *
 *  @param dynamicImageName The NSString object representing the filename of the image. This value will also be set as the accessibility identifier of the element.
 *  @param bundle           The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
 *  @param traitCollection  The traits associated with the intended environment for the image. Use this parameter to ensure that the correct variant of the image is loaded. If you specify nil, this method uses the traits associated with the main screen.
 */
- (void)setDynamicImageName:(NSString * _Nonnull)dynamicImageName inBundle:(NSBundle * _Nullable)bundle compatibleWithTraitCollection:(UITraitCollection * _Nullable)traitCollection;

/**
 *  Returns the accessibility identifier of the image object of the current image view.
 *
 *  @return A NSString object that identifies the image element; nil if none set or if no image.
 */
- (NSString * _Nullable)dynamicImageName;

@end

#endif
