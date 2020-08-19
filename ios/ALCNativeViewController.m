//
//  ALCNativeViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import "ALCNativeViewController.h"

@interface ALCNativeViewController ()

@property (nonatomic, assign) BOOL hideNavigationBar;

@end

@implementation ALCNativeViewController

- (instancetype)initWithModuleName:(NSString *)pageName props:(NSDictionary *)props options:(NSDictionary *)options {
    if (self = [super initWithNibName:nil bundle:nil]) {
        NSNumber *hideNavigationBar = options[@"hideNavigationBar"];
        _hideNavigationBar = hideNavigationBar.boolValue;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hideNavigationBar animated:animated];
}

@end
