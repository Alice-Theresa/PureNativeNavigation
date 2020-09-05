//
//  NativeViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import "ThisIsViewController.h"
#import "ALCNavigationManager.h"
#import "UIViewController+ALC.h"
#import "UINavigationController+ALC.h"

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
    
    UIButton *pop = [UIButton buttonWithType:UIButtonTypeSystem];
    [pop setTitle:@"pop RN" forState:UIControlStateNormal];
    pop.center = CGPointMake(self.view.center.x, self.view.center.y + 60);
    pop.bounds = CGRectMake(0, 0, 200, 120);
    [pop addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
}

- (void)go2RN {
    UIViewController *vc = [[ALCNavigationManager shared] fetchViewController:@"Detail" params:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pop {
    [self setResultCode:10 resultData:@{@"test": @"native"}];
    [self.navigationController alc_popViewControllerAnimated:YES];
}

- (void)didReceiveResultCode:(NSInteger)resultCode resultData:(NSDictionary *)data requestCode:(NSInteger)requestCode {
    NSLog(@"%@", data);
}

@end
