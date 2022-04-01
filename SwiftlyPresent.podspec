#
# Be sure to run `pod lib lint SwiftlyPresent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftlyPresent'
  s.version          = '0.1.1'
  s.summary          = 'A short description of SwiftlyPresent.'
  s.homepage         = 'https://github.com/jungseungyeo/SwiftlyPresent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jungseungyeo' => 'duwjdtmd91@gmail.com' }
  s.source           = { :git => 'https://github.com/jungseungyeo/SwiftlyPresent.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.platform     = :ios, '14.0'
  s.source_files = 'SwiftlyPresent/Classes/**/*'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
