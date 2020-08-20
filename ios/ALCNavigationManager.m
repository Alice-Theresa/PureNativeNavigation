//
//  ALCNavigationManager.m
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import <React/RCTLog.h>
#import <React/RCTConvert.h>
#import <React/RCTRootView.h>
#import "ALCNavigationManager.h"
#import "ALCNativeViewController.h"
#import "ALCReactViewController.h"

@interface ALCNavigationManager()

@property (nonatomic, strong, readwrite) NSMutableDictionary *nativeModules;
@property (nonatomic, strong, readwrite) NSMutableDictionary *reactModules;

@end

@implementation ALCNavigationManager

+ (instancetype)shared {
    static ALCNavigationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ALCNavigationManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _nativeModules = [[NSMutableDictionary alloc] init];
        _reactModules = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registerNativeModule:(NSString *)moduleName forController:(Class)clazz {
    [self.nativeModules setObject:clazz forKey:moduleName];
}

- (BOOL)hasNativeModule:(NSString *)moduleName {
    return [self.nativeModules objectForKey:moduleName] != nil;
}

- (Class)nativeModuleClassFromName:(NSString *)moduleName {
    return [self.nativeModules objectForKey:moduleName];
}

- (void)registerReactModule:(NSString *)moduleName options:(NSDictionary *)options {
    [self.reactModules setObject:options forKey:moduleName];
}

- (BOOL)hasReactModuleForName:(NSString *)moduleName {
    return [self.reactModules objectForKey:moduleName] != nil;
}

- (NSDictionary *)reactModuleOptionsForKey:(NSString *)moduleName {
    return [self.reactModules objectForKey:moduleName];
}

- (UIViewController *)fetchViewController:(NSString *)pageName params:(NSDictionary * __nullable)params {
    BOOL hasNativeVC = [self hasNativeModule:pageName];
    UIViewController *vc;
    if (hasNativeVC) {
        Class clazz = [self nativeModuleClassFromName:pageName];
        vc = [[clazz alloc] initWithModuleName:pageName props:params];
    } else {
        NSDictionary *options = [self reactModuleOptionsForKey:pageName];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:self.bridge
                                                         moduleName:pageName
                                                  initialProperties:params];
        vc = [[ALCReactViewController alloc] initWithModuleName:pageName props:params options:options];
        vc.view = rootView;
    }
    return vc;
}

- (UIImage *)fetchImage:(NSDictionary *)json {
  return [RCTConvert UIImage:json];
}

@end
