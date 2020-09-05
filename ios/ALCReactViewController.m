//
//  ALCReactViewController.m
//  PureNativeNavigation
//
//  Created by skylar on 2020/8/17.
//

#import <React/RCTRootView.h>
#import "ALCReactViewController.h"
#import "ALCNavigationManager.h"

@interface ALCReactViewController ()

@property (nonatomic, assign) BOOL hideNavigationBar;

@end

@implementation ALCReactViewController

- (instancetype)initWithModuleName:(NSString *)pageName options:(NSDictionary *)options {
    if (self = [super init]) {
        NSNumber *hideNavigationBar = options[@"hideNavigationBar"];
        _hideNavigationBar = hideNavigationBar.boolValue;
        self.title = options[@"title"];
        NSMutableDictionary *copied = [options mutableCopy];
        [copied setObject:self.screenID forKey:@"screenID"];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[ALCNavigationManager shared].bridge
                                                         moduleName:pageName
                                                  initialProperties:copied];
        self.view = rootView;
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
       @"KEY_RESULT_CODE": @(resultCode),
       @"KEY_RESULT_DATA": data ?: [NSNull null],
       @"KEY_SCREEN_ID": self.screenID
     }];
}

@end
