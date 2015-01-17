//  Define.h
//  DoctorApp
//  Created by User1 on 09/04/14.
//  Copyright (c) 2014 User1. All rights reserved.





//for future use
#define Header 45
#define Footer 60
#define Width self.view.frame.size.width

//font
//#define  KFontUsed  @"Open Sans"
#define  KFontUsed  @"Arial"

//standard color
#define UIColorForApp        [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]
#define UIColorForBG         [UIColor colorWithRed:136.0/255.0f green:41/255.0f blue:114/255.0f alpha:1.0]
#define UIColorForButton     [UIColor colorWithRed:228.0/255.0f green:114/255.0f blue:151/255.0f alpha:1.0]



//API
#define kBaseUrl @"http://pathwaybiz.com/clients/scavenger/api"

#define kLoginAPI                           @"login/"
#define kGridCategoriesAPI                  @"categories/"
#define kCategoriesDetailAPI                @"items/?cat"
#define kChangePassword                     @"login/"
#define kResetPassword                      @"login/"
#define kRegisterPush                       @"push/"


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
