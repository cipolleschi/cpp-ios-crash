//
//  main.m
//  testCxx
//
//  Created by Riccardo Cipolleschi on 26/08/2023.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <memory>
#import <glog/logging.h>
#import <double-conversion/bignum.h>
#import <boost/any.hpp>

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
    google::InitGoogleLogging(argv[0]);
    auto bigNum = double_conversion::Bignum();
    bigNum.AssignUInt16(100);
    LOG(INFO) << "Test glog";
    auto any = boost::any();
    
    auto ptr = std::make_shared<int>(0);
    
    
    
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
