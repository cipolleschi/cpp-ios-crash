source 'https://cdn.cocoapods.org/'

platform :ios, '13.4'

target 'testCxx' do
    pod 'glog', :podspec => "./third-party-podspecs/glog.podspec"
    pod 'DoubleConversion', :podspec => "./third-party-podspecs/DoubleConversion.podspec"
    pod 'boost', :podspec => "./third-party-podspecs/boost.podspec"
    pod 'fmt' , '~> 6.2.1'
    pod 'RCT-Folly', :podspec => "./third-party-podspecs/RCT-Folly.podspec", :modular_headers => true
    pod 'RCT-Folly/Fabric', :podspec => "./third-party-podspecs/RCT-Folly.podspec", :modular_headers => true
    pod 'RCT-Folly/Futures', :podspec => "./third-party-podspecs/RCT-Folly.podspec", :modular_headers => true
end

def __fix_double_definition_of_clockid_in_folly()
    # "Time.h:52:17: error: typedef redefinition with different types"
    # We need to make a patch to RCT-Folly - remove the `__IPHONE_OS_VERSION_MIN_REQUIRED` check.
    # See https://github.com/facebook/flipper/issues/834 for more details.
    time_header = "#{Pod::Config.instance.installation_root.to_s}/Pods/RCT-Folly/folly/portability/Time.h"
    `sed -i -e  $'s/ && (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_10_0)//' '#{time_header}'`
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

    __fix_double_definition_of_clockid_in_folly
end
