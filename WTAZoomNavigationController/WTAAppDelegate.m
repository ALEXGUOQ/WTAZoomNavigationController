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
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[self window] setTintColor:[UIColor purpleColor]];
    
    WTALeftViewController *leftViewController = [WTALeftViewController new];
    WTAZoomNavigationController *zoomNavigationController = [WTAZoomNavigationController new];
    [zoomNavigationController setSpringAnimationOn:YES];
    [zoomNavigationController setLeftViewController:leftViewController];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [imageView setContentMode:UIViewContentModeCenter];
    [zoomNavigationController setBackgroundView:imageView];
    
    [[self window] setRootViewController:zoomNavigationController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
