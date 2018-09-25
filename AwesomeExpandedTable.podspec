#
# Be sure to run `pod lib lint AwesomeExpandedTable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AwesomeExpandedTable'
  s.version          = '0.1.4'
  s.summary          = 'Just a table for infinity expanded cell'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      =  'For usage need only create child from pods files'

  s.homepage         = 'https://github.com/olegek/AwesomeExpandedTable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'olegek' => 'olegmytsouda@mail.ru' }
  s.source           = { :git => 'https://github.com/olegek/AwesomeExpandedTable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.swift_version = '4.0'
  
  s.source_files = '*'
  #s.resource_bundles = '*'
  # s.resource_bundles = {
  #   'AwesomeExpandedTable' => ['AwesomeExpandedTable/Assets/*']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
