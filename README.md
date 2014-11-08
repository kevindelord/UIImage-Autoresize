# UIImage+Autoreisze

[![CI Status](http://img.shields.io/travis/${USER_NAME}/${REPO_NAME}.svg?style=flat)](https://travis-ci.org/${USER_NAME}/${REPO_NAME})
[![Version](https://img.shields.io/cocoapods/v/${POD_NAME}.svg?style=flat)](http://cocoadocs.org/docsets/${POD_NAME})
[![License](https://img.shields.io/cocoapods/l/${POD_NAME}.svg?style=flat)](http://cocoadocs.org/docsets/${POD_NAME})
[![Platform](https://img.shields.io/cocoapods/p/${POD_NAME}.svg?style=flat)](http://cocoadocs.org/docsets/${POD_NAME})

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

The class is also available through this [Gist][https://gist.github.com/kevindelord/fe2e691d06ab745fbb00].

## Requirements

Through the categorised class `UIImage+Autoreisze`, a naming convention is applied to deal with different image files:

* **none** if @1x small old phones
* **@2x** for iPhone 4
* **-568h@2x** for iPhone 5
* **-667h@2x** for iPhone 6
* **@3x** for iPhone 6 Plus

When this class is integrated and imported into your project, you have nothing else to do.
In your PrefixHeader.pch file:

    #import "UIImage+DKHelper.h"

When you instantiate an image in your code:

    [UIImage imageNamed: @"background.png" ];

The code will `automatically` create an image corresponding to the current device

## Documentation

This pod is also documented on [CocoaDocs][http://cocoadocs.org/docsets/DKHelper/0.7.5/Categories/UIImage+DKHelper.html]

## Installation

${POD_NAME} is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

pod "UIImage+Autoreisze"

## TODO:
* iPad
* Make it work with Storyboard

## Author

${USER_NAME}, ${USER_EMAIL}

## License

${POD_NAME} is available under the MIT license. See the LICENSE file for more info.
