//
//  SecViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/9/6.
//

#import "SecViewController.h"
#import "ALCNavigationManager.h"
#import "UIViewController+ALC.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *push = [UIButton buttonWithType:UIButtonTypeSystem];
    [push setTitle:@"push RN" forState:UIControlStateNormal];
    push.center = self.view.center;
    push.bounds = CGRectMake(0, 0, 200, 60);
    [push addTarget:self action:@selector(go2RN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
    
    UIButton *pop = [UIButton buttonWithType:UIButtonTypeSystem];
    [pop setTitle:@"pop" forState:UIControlStateNormal];
    pop.center = CGPointMake(self.view.center.x, self.view.center.y + 60);
    pop.bounds = CGRectMake(0, 0, 200, 60);
    [pop addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
}

- (void)go2RN {
    UIViewController *vc = [[ALCNavigationManager shared] fetchViewController:@"Detail" params:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pop {
    [self setResult:@{@"some_key": @"sec_value"}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveResultData:(NSDictionary *)data type:(nonnull NSString *)type {
    NSLog(@"%@", data);
}
@end
