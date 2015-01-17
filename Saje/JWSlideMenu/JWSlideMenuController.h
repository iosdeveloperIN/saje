//  JWSlideMenuController.h
//  JWSlideMenu
//  Created by Jeremie Weldin on 11/14/11.
//  Copyright (c) 2011 Jeremie Weldin. All rights reserved.

#import <UIKit/UIKit.h>


@class JWNavigationController;
@class JWSlideMenuViewController;
@class AppDelegate;

@interface JWSlideMenuController : UIViewController <UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITextFieldDelegate>
{
    BOOL SearchBool;
    AppDelegate *mAppDelegate;
    UIButton *homeButton;


}

@property (strong, nonatomic) UITableView *menuTableView;
@property (strong, nonatomic) UIView *menuView;
//@property (retain, nonatomic) UIToolbar *contentToolbar;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIColor *menuLabelColor;
@property (strong, nonatomic) UISearchDisplayController *searchController;
@property (strong, nonatomic) UIButton *homeButton;

-(void)toggleMenu;


-(void)ChangetoInfo;
-(void)ChangeToHome;
-(void)ChangeToSettings;
-(void)ChangeToUpcomingCalls;
-(void)ChangeToDirections;
-(void)ChangeToCalendar;

-(void)HideHomeButton;
-(void)UnhideHomeButton;

-(JWNavigationController *)addViewController:(JWSlideMenuViewController *)controller withTitle:(NSString *)title andImage:(UIImage *)image;
-(void)Test;

@end
