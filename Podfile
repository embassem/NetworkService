# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'NetworkService.xcworkspace'
# project 'Client/Client.xcodeproj'
project 'NetworkService.xcodeproj'
project 'Demo/Demo.xcodeproj'

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

