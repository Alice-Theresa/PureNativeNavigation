//
//  ALCReactViewController.m
//  PureNativeNavigation
//
//  Created by skylar on 2020/8/17.
//

#import "ALCReactViewController.h"
#import "ALCNavigationManager.h"
#import "UIViewController+ALC.h"

@interface ALCReactViewController ()

@property (nonatomic, assign) BOOL hideNavigationBar;

@end

@implementation ALCReactViewController

- (instancetype)initWithModuleName:(NSString *)pageName options:(NSDictionary *)options {
    if (self = [super init]) {
        NSNumber *hideNavigationBar = options[@"hideNavigationBar"];
        _hideNavigationBar = hideNavigationBar.boolValue;
        self.title = options[@"title"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hideNavigationBar animated:animated];
}

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode {
    [ALCNavigationManager sendEvent:@"EVENT_NAVIGATION" data:
     @{
       @"KEY_ON": @"ON_COMPONENT_RESULT",
       @"KEY_REQUEST_CODE": @(requestCode),
       @"KEY_RESULT_CODE": @(self.resultCode),
       @"KEY_RESULT_DATA": self.resultData ?: [NSNull null],
     }];
}

@end
