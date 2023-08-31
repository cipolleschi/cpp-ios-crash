//
//  main.m
//  testCxx
//
//  Created by Riccardo Cipolleschi on 26/08/2023.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <memory>

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
    auto ptr = std::make_shared<int>(0);
    
    
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
