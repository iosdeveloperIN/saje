//
//  AppDelegate.h
//  Saje
//
//  Created by Nagendra Tripathi on 12/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICETutorialController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,ICETutorialControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ICETutorialController *viewController;
@property (assign, nonatomic) BOOL flag;


@end

