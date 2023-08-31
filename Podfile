source 'https://cdn.cocoapods.org/'

platform :ios, '13.4'

target 'testCxx' do
    pod 'glog', :podspec => "./third-party-podspecs/glog.podspec"
    pod 'DoubleConversion', :podspec => "./third-party-podspecs/DoubleConversion.podspec"
    pod 'boost', :podspec => "./third-party-podspecs/boost.podspec"
    pod 'fmt' , '~> 6.2.1'
end

post_install do |installer|
    installer.target_installation_results.pod_target_installation_results
        .each do |pod_name, target_installation_result|
            target_installation_result.native_target.build_configurations.each do |config|
                # unary_function and binary_function are no longer provided in C++17 and newer standard modes as part of Xcode 15. They can be re-enabled with setting _LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION
                # Ref: https://developer.apple.com/documentation/xcode-release-notes/xcode-15-release-notes#Deprecations
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= '$(inherited) '
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] << '"_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION" '
        end
    end
end
