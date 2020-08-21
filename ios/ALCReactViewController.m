//
//  ALCReactViewController.m
//  PureNativeNavigation
//
//  Created by skylar on 2020/8/17.
//

#import "ALCReactViewController.h"

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


@end
