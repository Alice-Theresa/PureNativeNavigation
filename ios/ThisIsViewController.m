//
//  NativeViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import "ThisIsViewController.h"
#import "ALCNavigationManager.h"

@interface ThisIsViewController ()

@end

@implementation ThisIsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *push = [UIButton buttonWithType:UIButtonTypeSystem];
    [push setTitle:@"push RN" forState:UIControlStateNormal];
    push.center = self.view.center;
    push.bounds = CGRectMake(0, 0, 200, 120);
    [push addTarget:self action:@selector(go2RN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
}

- (void)go2RN {
    UIViewController *vc = [[ALCNavigationManager shared] fetchViewController:@"Detail" params:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
