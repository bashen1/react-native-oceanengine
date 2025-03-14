require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name          = package['name']
  s.version       = package['version']
  s.summary       = package['description']
  s.description   = package['description']
  s.homepage      = package['homepage']
  s.license       = package['license']
  s.author        = package['author']
  s.platform      = :ios, "9.0"
  s.source        = { :git => "https://github.com/bashen1/react-native-oceanengine.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc  = true

  s.dependency "React-Core"
  s.dependency "BDASignalSDK", "1.0.3"

end