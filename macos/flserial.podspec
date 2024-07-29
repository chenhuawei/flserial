#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flserial.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flserial'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
#   s.source_files     = '../src/flserial.cpp', '../src/flserial.h'
  s.dependency 'FlutterMacOS'
#   s.vendored_frameworks = '../src/serial/serial.framework'
#   s.dependency 'serial'
#   s.vendored_libraries libserial.a
  s.vendored_frameworks = 'Frameworks/serial.framework'
#   s.vendored_libraries = 'Libraries/libserial.a'
#   s.vendored_frameworks = 'flserial.framework'
#   s.dependency 'flserial'
#  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' } #配置HeaderSearchPaths，libxml这个库需要这么配置
#   s.xcconfig = { 'HEADER_SEARCH_PATHS' => 'Frameworks/serial.framework/Headers','CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.platform = :osx, '10.11'
#   s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
#   s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'HEADER_SEARCH_PATHS' => 'Frameworks/serial.framework/Headers' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
