//
//  ALCNativeViewController.m
//  PureNativeNavigation
//
//  Created by Skylar on 2020/8/16.
//

#import "ALCNativeViewController.h"

@interface ALCNativeViewController ()

@end

@implementation ALCNativeViewController

- (instancetype)initWithModuleName:(NSString *)pageName props:(NSDictionary *)props options:(NSDictionary *)options {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _pageName = pageName;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
