Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "RWPickFlavor"
s.summary = "RWPickFlavor lets a user select an ice cream flavor."
s.requires_arc = true

# 2
s.version = "0.0.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "[Bassem Abbas]" => "[embassem@gmail.com]" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/embassem/NetworkService"

# For example,
# s.homepage = "https://github.com/embassem/NetworkService"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "[https://github.com/embassem/NetworkService.git]", :tag => "#{0.0.1}"}

# For example,
# s.source = { :git => "https://github.com/embassem/NetworkService.git", :tag => "#{0.0.1}"}

# 7
s.framework = "Foundation"
s.framework = "UIKit"
s.dependency 'Alamofire', '~> 4.3'
s.dependency 'ObjectMapper', '~> 2.2'
s.dependency 'SwiftyJSON', '~> 2.2'
s.dependency 'Moya', :git => 'https://github.com/embassem/Moya.git', :branch => 'v9beta'
s.dependency 'Moya-ObjectMapper'

# 8
s.source_files = "NetworkService/**/*.{swift,h,m}"

# 9
s.resources = "NetworkService/**/*.{png,jpeg,jpg,storyboard,xib}"
end
