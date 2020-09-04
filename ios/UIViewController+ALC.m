//
//  UIViewController+ALC.m
//  PureNativeNavigation
//
//  Created by skylar on 2020/9/4.
//

#import "UIViewController+ALC.h"

#import <objc/runtime.h>

@implementation UIViewController (ALC)

- (void)setResultCode:(NSInteger)resultCode {
    UIViewController *presenting = self.presentingViewController;
    if (presenting) {
        objc_setAssociatedObject(presenting.presentedViewController, @selector(resultCode), @(resultCode), OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    objc_setAssociatedObject(self, @selector(resultCode),@(resultCode), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)resultCode {
    NSNumber *code = objc_getAssociatedObject(self, _cmd);
    return [code integerValue];
}

- (void)setResultData:(NSDictionary *)data {
    UIViewController *presenting = self.presentingViewController;
    if (presenting) {
        objc_setAssociatedObject(presenting.presentedViewController, @selector(resultData), data, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    objc_setAssociatedObject(self, @selector(resultData), data, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)resultData {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRequestCode:(NSInteger)requestCode {
    objc_setAssociatedObject(self, @selector(requestCode), @(requestCode), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)requestCode {
    NSNumber *code = objc_getAssociatedObject(self, _cmd);
    return [code integerValue];
}

- (void)setResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data {
    self.resultCode = resultCode;
    self.resultData = data;
}

//- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode {
//    if ([self isKindOfClass:[UITabBarController class]]) {
//        UIViewController *child = ((UITabBarController *)self).selectedViewController;
//        [child didReceiveResultCode:resultCode resultData:data requestCode:requestCode];
//    } else if ([self isKindOfClass:[UINavigationController class]]) {
//        UIViewController *child = ((UINavigationController *)self).topViewController;
//        [child didReceiveResultCode:resultCode resultData:data requestCode:requestCode];
//    } else {
//        NSArray *children = self.childViewControllers;
//        if (children) {
//            for (UIViewController *vc in children) {
//                [vc didReceiveResultCode:resultCode resultData:data requestCode:requestCode];
//            }
//        }
//    }
//}

@end
