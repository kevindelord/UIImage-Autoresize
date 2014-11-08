Pod::Spec.new do |s|
  s.name             = "UIImage+Autoresize"
  s.version          = "0.1.1"
  s.summary          = "Apply a naming convention to deal with multiple image sizes for iPhone devices."
  s.homepage         = "https://github.com/kevindelord/UIImage-Autoresize.git"
  s.license          = 'MIT'
  s.author           = { "kevindelord" => "delord.kevin@gmail.com" }
  s.source           = { :git => "https://github.com/kevindelord/UIImage-Autoresize.git", :tag => s.version.to_s }
  s.platform         = :ios
  s.requires_arc     = true
  s.source_files     = 'Classes/*'
  s.public_header_files = 'Classes/*.h'
end
