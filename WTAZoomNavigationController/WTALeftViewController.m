//
//  WTALeftViewController.m
//  WTAZoomNavigationController
//
//  Created by Andrew Carter on 11/13/13.
//  Copyright (c) 2013 Andrew Carter. All rights reserved.
//

#import "WTALeftViewController.h"

#import "WTAContentViewController.h"
#import "WTAZoomNavigationController.h"

NSString * const WTATableCellIdentifier = @"WTATableCellIdentifier";

@interface WTALeftViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, assign) BOOL didSelectInitialViewController;

@end

@implementation WTALeftViewController

#pragma mark - UIViewController Overrides

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setDatasource:@[@"Option One", @"Option Two", @"Option Three", @"Option Four", @"Option Five"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:WTATableCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (![self didSelectInitialViewController])
    {
        [self setDidSelectInitialViewController:YES];
        [self tableView:[self tableView] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self datasource] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WTATableCellIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor clearColor]];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    [[cell textLabel] setText:[self datasource][[indexPath row]]];
    [cell setSelectedBackgroundView:[UIView new]];
    [[cell textLabel] setHighlightedTextColor:[UIColor purpleColor]];
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WTAContentViewController *contentViewController = [WTAContentViewController new];
    [[contentViewController navigationItem] setTitle:[self datasource][[indexPath row]]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [[self wta_zoomNavigationController] setContentViewController:navigationController];
    [[self wta_zoomNavigationController] hideLeftViewController:YES];
}

@end
