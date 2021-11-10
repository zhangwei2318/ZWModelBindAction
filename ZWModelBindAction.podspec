#
# Be sure to run `pod lib lint ZWModelBindAction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZWModelBindAction'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ZWModelBindAction.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Model与cell的点击事件进行了绑定,可以有效避免UItableView/UICollectionView的delegate中的判断
                       DESC

  s.homepage         = 'https://github.com/zhangwei2318/ZWModelBindAction'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangwei2318' => 'zhangwei2318@163.com' }
  s.source           = { :git => 'https://github.com/zhangwei2318/ZWModelBindAction.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZWModelBindAction/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZWModelBindAction' => ['ZWModelBindAction/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
