//
//  UIImage+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIImage_h__
#define DKHelper_UIImage_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIImage to add a bunch of helping methods.
 */
@interface UIImage (DKHelper)

#pragma mark - UIImage Initializer

/**
 * Method to override the UIImage::imageNamed: method with the retina4ImageNamed: one.
 * The new method and its implementation will be executed instead of the default UIImage::imageNamed:
 * The user don't need to do anything.
 */
+ (void)initialize;

/**
 * Returns a new UIImage object created from a filename.
 *
 * @discussion If needed, this method will automatically add the needed image suffix for the current device:
 * - "@2x"
 * - "-568h@2x"
 * - "-667h@2x"
 * - "@3x"
 * Important: the given filename should NOT contain any size-extension, only a name and its file type.
 *
 * @param imageName The NSString object representing the filename of the image.
 * @return An UIImage created from a given string.
 */
+ (UIImage *)dynamicImageNamed:(NSString *)imageName;

@end

#endif