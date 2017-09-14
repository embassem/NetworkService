#
# Be sure to run `pod lib lint NetworkService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NetworkService'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NetworkService.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/embassem/NetworkService'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'License.md' }
  s.author           = { 'Bassem Abbas' => 'embassem@gmail.com' }
  s.source           = { :git => 'https://github.com/embassem/NetworkService.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  #s.source_files = 'NetworkService/**/*'
  
  # s.resource_bundles = {
  #   'NetworkService' => ['NetworkService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  #s.framework = 'Foundation'
  #s.framework = 'UIKit'
  #s.dependency 'Alamofire', '~> 4.3'
  #s.dependency 'ObjectMapper', '~> 2.2'
  #s.dependency 'SwiftyJSON', '~> 2.2'
  #s.dependency 'Moya','~> 9.0.0'
  #s.dependency 'Moya-ObjectMapper'

  #s.resources = "NetworkService/**/*.{png,jpeg,jpg,storyboard,xib}"

 # s.subspec "Core" do |ss|
    s.resources = "NetworkService/Sources/Core/**/*.{png,jpeg,jpg,storyboard,xib}"
    s.source_files  = "Sources/Core"
    s.framework  = "Foundation"
    s.dependency 'Alamofire', '~> 4.3'
    s.dependency "Result", "~> 3.0"
    s.dependency 'ObjectMapper', '~> 2.2'
    s.dependency 'SwiftyJSON', '~> 3.1'
    s.dependency 'Moya','~> 9.0'
    s.dependency 'Moya-ObjectMapper'
  #end

  #s.subspec "Log" do |ss|
  #  ss.source_files = "Sources/ReactiveMoya/"
  #  ss.dependency "Moya/Core"
  #  ss.dependency "ReactiveSwift", "~> 2.0"
  #end

end

