//
//  UIViewController+ALC.h
//  PureNativeNavigation
//
//  Created by skylar on 2020/9/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ALCSetResultDelegate <NSObject>

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode;

@end

@interface UIViewController (ALC)

@property (nonatomic, copy, readonly) NSString *screenID;

@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, assign) NSInteger requestCode;
@property (nonatomic, copy  ) NSDictionary *resultData;

- (void)setResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
