//
//  WTAContentViewController.m
//  WTAZoomNavigationController
//
//  Created by Andrew Carter on 11/13/13.
//  Copyright (c) 2013 Andrew Carter. All rights reserved.
//

#import "WTAContentViewController.h"

#import "WTAZoomNavigationController.h"

@interface WTAContentViewController ()

@end

@implementation WTAContentViewController

#pragma mark - UIViewController Overrides

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setupNavigationItem];
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - Instance Methods

- (void)setupNavigationItem
{
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(menuBarButtonItemPressed:)];
    [[self navigationItem] setLeftBarButtonItem:menuBarButtonItem];
}

- (void)menuBarButtonItemPressed:(id)sender
{
    [[self wta_zoomNavigationController] revealLeftViewController:YES];
}

@end
