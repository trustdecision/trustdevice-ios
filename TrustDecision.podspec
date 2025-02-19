#
# Be sure to run `pod lib lint TrustDecision.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TrustDecision'
  s.version          = '1.6'
  s.summary          = 'Local fingerprint of trust device.'
  s.description      = 'Local fingerprint of trust device, generate your unique device fingerprint.'
  s.homepage         = 'https://trustdecision.com/trustDevice'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TrustDevice' => 'TrustDevice@TrustDecision.com' }
  s.source           = { :git => 'https://github.com/trustdecision/trustdevice-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'TrustDecision/Classes/**/*'
  s.static_framework = true
  s.public_header_files = ['TrustDecision/Classes/TDMobRisk.h','TrustDecision/Classes/TDMobRiskManager.h']
end
