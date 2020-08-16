//
//  RouterManager.h
//  router
//
//  Created by Skylar on 2020/8/15.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationManager : NSObject

+ (instancetype)shared;

@property (nonatomic, strong) RCTBridge *bridge;

@end

NS_ASSUME_NONNULL_END
