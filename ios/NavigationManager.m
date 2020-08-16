//
//  NavigationManager.m
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import "NavigationManager.h"

@implementation NavigationManager

+ (instancetype)shared {
    static NavigationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NavigationManager alloc] init];
    });
    return manager;
}

@end
