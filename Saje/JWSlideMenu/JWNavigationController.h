//
//  JWNavigationController.h
//  JWSlideMenu
//
//  Created by Jeremie Weldin on 11/22/11.
//  Copyright (c) 2011 Jeremie Weldin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWSlideMenuController;

@interface JWNavigationController : UIViewController <UINavigationBarDelegate>

@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) JWSlideMenuController *slideMenuController;
@property (nonatomic, strong, readonly) UIViewController *rootViewController;

- (id)initWithRootViewController:(UIViewController *)rootViewController;
- (void)pushViewController:(UIViewController *)controller;
- (UIViewController *)popViewController;

@end
