//
//  WTAZoomNavigationController.h
//  WTAZoomNavigationController
//
//  Created by Andrew Carter on 11/13/13.
//  Copyright (c) 2013 Andrew Carter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTAZoomNavigationController : UIViewController

- (void)hideLeftViewController:(BOOL)animated;
- (void)revealLeftViewController:(BOOL)animated;

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, assign, getter = isSpringAnimationOn) BOOL springAnimationOn;

@end

@interface UIViewController (WTAZoomNavigationController)

@property (nonatomic, readonly) WTAZoomNavigationController *wta_zoomNavigationController;

@end
