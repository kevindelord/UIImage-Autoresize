#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIImage+Autoresize"
  s.version          = "0.1.0"
  s.summary          = "Apply a naming convention to deal with multiple image sizes for iPhone devices."
  s.description      = <<-DESC
Through the categorised class `UIImage+Autoresize`, a naming convention is applied to deal with different image files:

* **none** if @1x small old phones
* **@2x** for iPhone 4
* **-568h@2x** for iPhone 5
* **-667h@2x** for iPhone 6
* **@3x** for iPhone 6 Plus
                       DESC
  s.homepage         = "https://github.com/kevindelord/UIImage-Autoresize.git"
  s.license          = 'MIT'
  s.author           = { "kevindelord" => "delord.kevin@gmail.com" }
  s.source           = { :git => "https://github.com/kevindelord/UIImage-Autoresize.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.requires_arc     = true

  s.source_files     = 'Classes/*'
  s.public_header_files = 'Classes/*.h'
end
