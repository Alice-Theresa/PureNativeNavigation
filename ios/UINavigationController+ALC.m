//
//  UINavigationController+ALC.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/9/5.
//

#import "UINavigationController+ALC.h"
#import "UIViewController+ALC.h"

@implementation UINavigationController (ALC)

- (void)alc_popViewControllerAnimated:(BOOL)animated {
  NSInteger resultCode = self.topViewController.resultCode;
  NSInteger requestCode = self.topViewController.requestCode;
  NSDictionary *resultData = self.topViewController.resultData;
  [self popViewControllerAnimated:YES];
  [self.topViewController didReceiveResultCode:resultCode resultData:resultData requestCode:requestCode];
}

@end
