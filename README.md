# UIImage+Autoresize

[![Version](https://img.shields.io/cocoapods/v/UIImage+Autoresize.svg?style=flat)](http://cocoadocs.org/docsets/UIImage+Autoresize)
[![License](https://img.shields.io/cocoapods/l/UIImage+Autoresize.svg?style=flat)](http://cocoadocs.org/docsets/UIImage+Autoresize)
[![Platform](https://img.shields.io/cocoapods/p/UIImage+Autoresize.svg?style=flat)](http://cocoadocs.org/docsets/UIImage+Autoresize)

### Description

This project is an UIImage extension which automatically generate a valid UIImage object based on the current device's size and orientation.
Working on iPhones and iPads on portrait and landscape modes, this library will add, if needed, a suffix to the given image filename in order to find and display the correct asset.
The suffixes are described as [requirements](https://github.com/kevindelord/UIImage-Autoresize/tree/master#requirements).

## Installation

UIImage+Autoresize is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UIImage+Autoresize"

And finally import the header file:

    #import "UIImage+Autoresize.h"

You are now ready to go!

## Documentation

This pod is also documented on [CocoaDocs](http://cocoadocs.org/docsets/UIImage+Autoresize)

## Requirements

Through the categorised class `UIImage+Autoresize`, a naming convention is applied to deal with different image files.
The following suffixes are expected:

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

* **none** for 3GS and earlier
* **@2x** for iPhone 4, 4S
* **-568h@2x** for iPhone 5, 5C, 5S
* **-667h@2x** for iPhone 6
* **@3x** for iPhone 6 Plus
* **-512h** for iPad Mini, iPad 2, iPad 1
* **-1024h@2x** for iPad Mini 3, iPad Mini 2, iPad Air, iPad Air 2

When this class is integrated into your project, you have nothing else to do.
You can instantiate an image in your code as you used to like this:

    [UIImage imageNamed: @"background.png" ];

The code will `automatically` load an image corresponding to the current device.
You do NOT need to specify any file extension, if you do the library will ignore itself and only load the file you are asking for.

## Rotating screen: Portrait & Landscape modes

When dealing with multiple interface orientation, an app might need different backgrounds.
One for the portrait mode and another one for the landscape.
With `UIImage+Autoresize` and its naming convention you could even use the same asset name in the code.
The displayed picture will simply change by implementing the folloying methods in your view controller:

On iOS 8 :

    - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
        [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
        self.imageView.image = [UIImage imageNamed:@"bg.png" withTransitionSize:size];
    }

On iOS 7:

    - (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
        [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
        self.imageView.image = [UIImage imageNamed:@"bg.png" ];
    }

### Tips

If you are implementing a multi interface orientation app, it would be good to do the first initialization of your UIImageView in the viewWillAppear.
This way, you should have less problems when the orientation change while a child view controller is presented. When the user pop back the previous background will look as it should.

## Swift

The library works with Swift as smooth as it does in Obj-C. Nothing to worry about :)

## Example

To run the example project, clone the repo, and open the `UIImage+Autoresize.xcodeproj` file.

The class is also available through this [Gist](https://gist.github.com/kevindelord/fe2e691d06ab745fbb00).


## TODO:
* Make it work with Storyboard

## Special thanks to
Dennis Rieth for the assets, dennis@ieth.de

## Author

kevindelord, delord.kevin@gmail.com

## License

UIImage+Autoresize is available under the MIT license. See the LICENSE file for more info.
