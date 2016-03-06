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

/**
 * A categorized class of UIImage replacing the default `UIImage::imageNamed:` method with a custom one.
 * Mainly used for fullscreen background images, this class adds a naming convetion to deal image assets 
 * with different sizes, orientations and scales.
 *
 * The suffixes are describe in the `README.md`.
 *
 */
@interface UIImage (Autoresize)

#pragma mark - UIImage Initializer

/**
 * Method to override the `UIImage::imageNamed:` method with a custom one.
 * The new method and its implementation will be executed instead of the default UIImage::imageNamed:
 * The user don't need to do anything.
 */
+ (void)load;

/**
 * Returns a new UIImage object created from a filename and a required transition Size.
 *
 * @discussion This function should be called from a view controller when the device changes its orientation.
 * The function `viewWillTransitionToSize:withTransitionCoordinator:` is only available from iOS 8.
 *
 * @param imageName The NSString object representing the filename of the image.
 * @param size The new size for the container’s view.
 * @return An UIImage created from a generated string name.
 */
+ (UIImage *)imageNamed:(NSString *)imageName withTransitionSize:(CGSize)size;

@end

#endif
