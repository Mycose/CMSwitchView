#
# Be sure to run `pod lib lint CMSwitchView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CMSwitchView"
  s.version          = "0.1.0"
  s.summary          = "CMSwitchView is a cool customizable switch view and with a pan gesture on it."
  s.description      = "You can customize for now the background color when selected or not. The border width and color.
                        The width/height of the dot. If you want rounded or not."
  s.homepage         = "https://github.com/Mycose/CMSwitchView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mycose" => "morissard@gmail.com" }
  s.source           = { :git => "https://github.com/Mycose/CMSwitchView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CMSwitchView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
