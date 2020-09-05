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
    objc_setAssociatedObject(self, @selector(resultCode),@(resultCode), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)resultCode {
    NSNumber *code = objc_getAssociatedObject(self, _cmd);
    return [code integerValue];
}

- (void)setResultData:(NSDictionary *)data {
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

- (NSString *)screenID {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (!obj) {
        obj = [[NSUUID UUID] UUIDString];
        objc_setAssociatedObject(self, @selector(screenID), obj, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
     return obj;
}

- (void)setResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data {
    self.resultCode = resultCode;
    self.resultData = data;
}

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode {
  
}

@end
