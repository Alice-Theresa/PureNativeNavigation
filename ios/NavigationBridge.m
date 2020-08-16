//
//  NavigationBridge.m
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import "NavigationBridge.h"
#import <React/RCTRootView.h>
#import "NavigationManager.h"
#import <React/RCTView.h>
#import <React/RCTLog.h>
#import "ALCNativeViewController.h"

@implementation NavigationBridge

RCT_EXPORT_MODULE(NavigationBridge)

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

- (NSArray<NSString *> *)supportedEvents {
    return @[];
}

RCT_EXPORT_METHOD(setRoot:(NSDictionary *)rootTree) {
    NSDictionary *root = rootTree[@"root"];
    NSArray *tabs = root[@"tabs"][@"children"];
    
    NSMutableArray *controllers = [NSMutableArray array];
    for (NSDictionary *tab in tabs) {
      NSString *name = tab[@"name"];
      NSDictionary *options = tab[@"options"];
      RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[NavigationManager shared].bridge
                                                       moduleName:name
                                                initialProperties:nil];
      UIViewController *viewController = [UIViewController new];
      viewController.view = rootView;
      UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
      nav.title = name;
      NSNumber *hideNavigationBar = options[@"hideNavigationBar"];
      if (hideNavigationBar.boolValue == YES) {
        nav.navigationBarHidden = YES;
      }
      [controllers addObject:nav];
    }
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = controllers;
    UIWindow *window = RCTSharedApplication().delegate.window;
    window.rootViewController = tbc;
}

RCT_EXPORT_METHOD(push:(NSString *)pageName params:(NSDictionary *)params) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    UINavigationController *nav = tbc.selectedViewController;
    UIViewController *viewController = [self fetchViewController:pageName params:params];
    viewController.hidesBottomBarWhenPushed  = YES;
    [nav pushViewController:viewController animated:true];
}

RCT_EXPORT_METHOD(pop) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    UINavigationController *nav = tbc.selectedViewController;
    [nav popViewControllerAnimated:YES];
}

RCT_EXPORT_METHOD(popToRoot) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    UINavigationController *nav = tbc.selectedViewController;
    [nav popToRootViewControllerAnimated:YES];
}

RCT_EXPORT_METHOD(present:(NSString *)pageName params:(NSDictionary *)params) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    UINavigationController *nav = tbc.selectedViewController;
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[NavigationManager shared].bridge
                                                     moduleName:pageName
                                              initialProperties:params];
    UIViewController *viewController = [UIViewController new];
    viewController.view = rootView;
    [nav presentViewController:viewController animated:YES completion:nil];
}

RCT_EXPORT_METHOD(dismiss) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    [tbc dismissViewControllerAnimated:YES completion:nil];
}

RCT_EXPORT_METHOD(switchTab:(NSNumber *)index) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    tbc.selectedIndex = index.integerValue;
}

RCT_EXPORT_METHOD(logRoute) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    
    NSMutableArray *route = [NSMutableArray array];
    
    NSLog(@"%@", tbc.selectedViewController);
    [route addObject:[NSString stringWithFormat:@"%@", tbc.selectedViewController.title]];
    for (UIViewController *vc in tbc.selectedViewController.childViewControllers) {
      [route addObject:[NSString stringWithFormat:@"%@", vc.title]];
    }
    NSLog(@"%@", route);
}

- (UIViewController *)fetchViewController:(NSString *)pageName  params:(NSDictionary *)params {
  BOOL hasNativeVC = [[NavigationManager shared] hasNativeModule:pageName];
  UIViewController *vc;
  if (hasNativeVC) {
    Class clazz = [[NavigationManager shared] nativeModuleClassFromName:pageName];
    vc = [[clazz alloc] initWithModuleName:pageName props:params[@"props"] options:params[@"options"]];
  } else {
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[NavigationManager shared].bridge
                                                     moduleName:pageName
                                              initialProperties:params];
    vc = [UIViewController new];
    vc.view = rootView;
  }
  return vc;
}

@end
