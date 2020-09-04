//
//  ALCNativeViewController.h
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCNativeViewController : UIViewController

- (instancetype)initWithModuleName:(NSString *)pageName props:(NSDictionary *)props;

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode;

@end

NS_ASSUME_NONNULL_END
