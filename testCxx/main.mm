//
//  main.m
//  testCxx
//
//  Created by Riccardo Cipolleschi on 26/08/2023.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

struct St {
};

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
    auto ptr = new St;
    NSLog(@"%p", ptr);
    delete ptr;
    
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
