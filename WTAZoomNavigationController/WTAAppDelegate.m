//
//  WTAAppDelegate.m
//  WTAZoomNavigationController
//
//  Created by Andrew Carter on 11/13/13.
//  Copyright (c) 2013 Andrew Carter. All rights reserved.
//

#import "WTAAppDelegate.h"

#import "WTALeftViewController.h"
#import "WTAContentViewController.h"
#import "WTAZoomNavigationController.h"

@implementation WTAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor purpleColor];
    
    WTALeftViewController *leftViewController = [WTALeftViewController new];
    WTAContentViewController *contentViewController = [WTAContentViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    WTAZoomNavigationController *zoomNavigationController = [WTAZoomNavigationController new];
    [zoomNavigationController setContentViewController:navigationController];
    [zoomNavigationController setLeftViewController:leftViewController];
    
    UIView *backgroundView = [UIView new];
    [backgroundView setBackgroundColor:[UIColor blueColor]];
    [zoomNavigationController setBackgroundView:backgroundView];
    
    [[self window] setRootViewController:zoomNavigationController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
