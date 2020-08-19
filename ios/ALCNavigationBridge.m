//
//  ALCNavigationBridge.m
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import "ALCNavigationBridge.h"
#import <React/RCTRootView.h>
#import <React/RCTConvert.h>
#import "ALCNavigationManager.h"
#import <React/RCTView.h>
#import <React/RCTLog.h>
#import "ALCNativeViewController.h"
#import "ALCReactViewController.h"

@interface  ALCNavigationBridge ()

@property (nonatomic, strong) ALCNavigationManager *manager;

@end

@implementation ALCNavigationBridge

RCT_EXPORT_MODULE(ALCNavigationBridge)

- (instancetype)init {
    if (self = [super init]) {
        _manager = [ALCNavigationManager shared];
    }
    return self;
}

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
        NSString *component = tab[@"component"];
        NSString *title = tab[@"title"];
        NSDictionary *icon = tab[@"icon"];
        UIViewController *viewController = [self fetchViewController:component params:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        nav.title = title;
        nav.tabBarItem.image = [self fetchImage:icon];
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
    UIViewController *viewController = [self fetchViewController:pageName params:params];
    [nav presentViewController:viewController animated:YES completion:nil];
}

RCT_EXPORT_METHOD(dismiss) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    [tbc dismissViewControllerAnimated:YES completion:nil];
}

RCT_EXPORT_METHOD(switchTab:(NSNumber * __nonnull)index) {
    UIWindow *window = RCTSharedApplication().delegate.window;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    tbc.selectedIndex = index.integerValue;
}

RCT_EXPORT_METHOD(registerReactComponent:(NSString *)appKey options:(NSDictionary *)options) {
    [self.manager registerReactModule:appKey options:options];
}

- (UIViewController *)fetchViewController:(NSString *)pageName params:(NSDictionary *)params {
    BOOL hasNativeVC = [self.manager hasNativeModule:pageName];
    UIViewController *vc;
    if (hasNativeVC) {
        Class clazz = [self.manager nativeModuleClassFromName:pageName];
        vc = [[clazz alloc] initWithModuleName:pageName props:params[@"props"] options:params[@"options"]];
    } else {
        NSDictionary *options = [self.manager reactModuleOptionsForKey:pageName];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:self.manager.bridge
                                                         moduleName:pageName
                                                  initialProperties:params];
        vc = [[ALCReactViewController alloc] initWithModuleName:pageName props:params[@"props"] options:options];
        vc.view = rootView;
    }
    return vc;
}

- (UIImage *)fetchImage:(NSDictionary *)json {
  return [RCTConvert UIImage:json];
}

@end
