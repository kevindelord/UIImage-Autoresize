DKScreenSize
============


Through the categorised class `UIImage+DKHelper`, I apply a naming convention to deal with different image files:

* **none** if @1x small old phones
* **@2x** for iPhone 4
* **-568h@2x** for iPhone 5
* **-667h@2x** for iPhone 6
* **@3x** for iPhone 6 Plus

When this class is integrated and imported into your project, you have nothing else to do.
In your PrefixHeader.pch file:

    #import "UIImage+DKHelper.h"

When you instantiate an image in your code (or in storyboard):

    [UIImage imageNamed: @"background.png" ];

The code will `automatically` create an image corresponding to the current device

The class is also available through this [Gist][3].
And is also documented on [CocoaPods][1] through this pod: [DKHelper][2]

  [1]: http://cocoadocs.org/docsets/DKHelper/0.7.5/Categories/UIImage+DKHelper.html
  [2]: https://github.com/kevindelord/DKHelper
  [3]: https://gist.github.com/kevindelord/fe2e691d06ab745fbb00
