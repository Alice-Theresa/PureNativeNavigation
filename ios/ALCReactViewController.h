//
//  ALCReactViewController.h
//  PureNativeNavigation
//
//  Created by skylar on 2020/8/17.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ALC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALCReactViewController : UIViewController <ALCSetResultDelegate>

- (instancetype)initWithModuleName:(NSString *)pageName options:(NSDictionary *)options;

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode;

@end

NS_ASSUME_NONNULL_END
