//
//  ALCNativeViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import "ALCNativeViewController.h"
#import "ALCNavigationManager.h"

@interface ALCNativeViewController ()

@property (nonatomic, assign) BOOL hideNavigationBar;

@end

@implementation ALCNativeViewController

- (instancetype)initWithModuleName:(NSString *)pageName props:(NSDictionary *)props {
    if (self = [super init]) {
        self.title = props[@"title"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hideNavigationBar animated:animated];
}

- (void)didReceiveResultData:(NSDictionary *)data type:(NSString *)type {
    [ALCNavigationManager sendEvent:@"EVENT_NAVIGATION" data:
    @{
      @"KEY_ON": @"ON_COMPONENT_RESULT",
      @"result_type" : type,
      @"KEY_RESULT_DATA": data ?: [NSNull null],
      @"KEY_SCREEN_ID": self.screenID
    }];
}

@end
