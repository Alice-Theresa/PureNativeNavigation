//
//  UINavigationController+ALC.h
//  PureNativeNavigation
//
//  Created by Skylar on 2020/9/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (ALC)

- (void)alc_popViewControllerAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
