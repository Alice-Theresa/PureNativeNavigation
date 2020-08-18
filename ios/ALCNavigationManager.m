//
//  ALCNavigationManager.m
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import "ALCNavigationManager.h"

@interface ALCNavigationManager()

@property(nonatomic, strong) NSMutableDictionary *nativeModules;

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
    }
    return self;
}

- (void)registerNativeModule:(NSString *)moduleName forController:(Class)clazz {
    [self.nativeModules setObject:clazz forKey:moduleName];
}

- (BOOL)hasNativeModule:(NSString *)moduleName {
    return  [self.nativeModules objectForKey:moduleName] != nil;
}

- (Class)nativeModuleClassFromName:(NSString *)moduleName {
    return [self.nativeModules objectForKey:moduleName];
}


@end
