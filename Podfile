# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'NetworkService.xcworkspace'
# project 'Client/Client.xcodeproj'
project 'NetworkService.xcodeproj'
project 'Demo/Demo.xcodeproj'
project 'Example/Example-Bundesliga/Example-Bundesliga.xcodeproj'
target 'NetworkService' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NetworkService

  pod 'Alamofire' #, '~> 4.3'
  pod 'ObjectMapper'#, '~> 2.2'
  pod 'SwiftyJSON'
  pod 'Moya', :git => 'https://github.com/embassem/Moya.git', :branch => 'v9beta'
  pod 'Moya-ObjectMapper', :git => 'https://github.com/ivanbruel/Moya-ObjectMapper'

project 'NetworkService.xcodeproj'

end


target 'Demo' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for NetworkService
    
    pod 'Alamofire' #, '~> 4.3'
    pod 'ObjectMapper'#, '~> 2.2'
    pod 'SwiftyJSON'
    pod 'Moya', :git => 'https://github.com/embassem/Moya.git', :branch => 'v9beta'
    pod 'Moya-ObjectMapper', :git => 'https://github.com/ivanbruel/Moya-ObjectMapper'
    
    project 'Demo/Demo.xcodeproj'
 
end


target 'Example-Bundesliga' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for NetworkService
    
    pod 'Alamofire' #, '~> 4.3'
    pod 'ObjectMapper'#, '~> 2.2'
    pod 'SwiftyJSON'
    pod 'Moya', :git => 'https://github.com/embassem/Moya.git', :branch => 'v9beta'
    pod 'Moya-ObjectMapper', :git => 'https://github.com/ivanbruel/Moya-ObjectMapper'
    
   
    pod 'AlamofireImage', '~> 3.2'
    pod 'AlamofireNetworkActivityIndicator', '~> 2.0'
    pod 'AlamofireObjectMapper'
    pod 'Moya'#, :git => 'https://github.com/Moya/Moya'
    pod 'ReachabilitySwift', '~> 3'
    pod 'PKHUD', '~> 4.0'
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'SwifterSwift'
    pod 'RealmSwift'
    pod 'ObjectMapper+Realm'
    pod 'CocoaLumberjack', '2.3'
    pod 'SVGKit', :git => 'https://github.com/SVGKit/SVGKit.git', :branch => '2.x'
    
    pod 'NetworkService', :path => '../'
    
    project 'Example/Example-Bundesliga/Example-Bundesliga.xcodeproj'
    
end

