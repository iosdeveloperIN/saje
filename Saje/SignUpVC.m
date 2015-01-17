//
//  SignUpVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 12/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "SignUpVC.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

#import "SignUpArtist.h"

#import "NewServiceVC.h"
#import "SettingsVC.h"
#import "ShareVC.h"
#import "LogoutVC.h"
#import "JWSlideMenuViewController.h"
#import "JWSlideMenuController.h"


@interface SignUpVC ()<UITextFieldDelegate>
{
    JWSlideMenuController *slideMenu;
    CGFloat animatedDistance;
    AppDelegate *delegate;
    
    
    
    UITextField  *textfield_FirstName;
    UITextField  *textfield_LastName;
    UITextField  *textfield_UserName;
    UITextField  *textfield_Email;
    UITextField  *textfield_Password;
    UITextField  *textfield_CPassword;
    UITextField  *textfield_RefCode;

}
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    

#define Height 40
#define from_X 200
#define HEIGH  self.view.frame.size.height
    
    
    UIImageView * imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,Width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setBackgroundColor:[UIColor clearColor]];
    [imageview_TopBar setImage:[UIImage imageNamed:@"nav bar@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 , Width, 25)];
    lbl_title.backgroundColor = [UIColor clearColor];
    lbl_title.textColor = [UIColor whiteColor];
    lbl_title.font = [UIFont fontWithName:KFontUsed size:15.0];
    lbl_title.text = @"Sign Up";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    
    
    UIImageView *imgArtist=[UIImageView new];
    imgArtist.frame=CGRectMake(10, 70, Width-20, 100);
    [imgArtist setImage:[UIImage imageNamed:@"iamclient@2x"]];
    [imgArtist setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgArtist];
    
    UIButton *btn_Client=[[UIButton alloc]initWithFrame:CGRectMake(80,90,80,80)];
    [btn_Client addTarget:self action:@selector(btn_ClientClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Client setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Client];

    
    UIButton *btn_Artist=[[UIButton alloc]initWithFrame:CGRectMake(180,90,80,80)];
    [btn_Artist addTarget:self action:@selector(btn_ArtistClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Artist setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Artist];
 
    
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        UIView *paddingView6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    

    
    
    textfield_FirstName = [[UITextField alloc]init];
    textfield_LastName  = [[UITextField alloc]init];
    textfield_UserName  = [[UITextField alloc]init];
    textfield_Email     = [[UITextField alloc]init];
    textfield_Password  = [[UITextField alloc]init];
    textfield_CPassword = [[UITextField alloc]init];
    textfield_RefCode   = [[UITextField alloc]init];
    
    [textfield_FirstName setFrame:CGRectMake(0, from_X, Width, Height)];
    [textfield_FirstName setDelegate:self];
    textfield_FirstName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_FirstName.clipsToBounds = YES;
    textfield_FirstName.textAlignment = NSTextAlignmentLeft;
    textfield_FirstName.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_FirstName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_FirstName setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_FirstName setTextColor:[UIColor blackColor]];
    [textfield_FirstName setBackgroundColor:[UIColor clearColor]];
    [textfield_FirstName setPlaceholder:@"First Name" ];
    [textfield_FirstName setValue:UIColorForBG
    forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_FirstName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_FirstName setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_FirstName setReturnKeyType:UIReturnKeyDone];
    [textfield_FirstName setUserInteractionEnabled:YES];
    textfield_FirstName.leftView = paddingView1;
    textfield_FirstName.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textfield_FirstName];
   
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(20,  textfield_FirstName.frame.origin.y+Height, Width-40, 1);
    V1.backgroundColor=UIColorForBG;
    [self.view addSubview:V1];
    
    
    [textfield_LastName setFrame:CGRectMake(0, from_X+Height, Width, Height)];
    [textfield_LastName setDelegate:self];
    textfield_LastName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_LastName.clipsToBounds = YES;
    textfield_LastName.textAlignment = NSTextAlignmentLeft;
    textfield_LastName.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_LastName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_LastName setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_LastName setTextColor:[UIColor blackColor]];
    [textfield_LastName setBackgroundColor:[UIColor clearColor]];
    [textfield_LastName setPlaceholder:@"Last Name" ];
    [textfield_LastName setValue:UIColorForBG
                       forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_LastName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_LastName setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_LastName setReturnKeyType:UIReturnKeyDone];
    [textfield_LastName setUserInteractionEnabled:YES];
    textfield_LastName.leftView = paddingView2;
    textfield_LastName.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textfield_LastName];
    
    UIView *V2= [UIView new];
    V2.frame=CGRectMake(20, textfield_LastName.frame.origin.y+Height, Width-40, 1);
    V2.backgroundColor=UIColorForBG;
    [self.view addSubview:V2];

    
    [textfield_Email setFrame:CGRectMake(0, from_X+2*Height, Width, Height)];
    [textfield_Email setDelegate:self];
    textfield_Email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_Email.clipsToBounds = YES;
    textfield_Email.textAlignment = NSTextAlignmentLeft;
    textfield_Email.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_Email.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_Email setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_Email setTextColor:[UIColor blackColor]];
    [textfield_Email setBackgroundColor:[UIColor clearColor]];
    [textfield_Email setPlaceholder:@"Email" ];
    [textfield_Email setValue:UIColorForBG
                      forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_Email setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_Email setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_Email setReturnKeyType:UIReturnKeyDone];
    [textfield_Email setUserInteractionEnabled:YES];
    textfield_Email.leftView = paddingView3;
    textfield_Email.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textfield_Email];
    
    UIView *V3= [UIView new];
    V3.frame=CGRectMake(20, textfield_Email.frame.origin.y+Height, Width-40, 1);
    V3.backgroundColor=UIColorForBG;
    [self.view addSubview:V3];
    
    
    [textfield_Password setFrame:CGRectMake(0, from_X+3*Height, Width, Height)];
    [textfield_Password setDelegate:self];
    textfield_Password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_Password.clipsToBounds = YES;
    textfield_Password.textAlignment = NSTextAlignmentLeft;
    textfield_Password.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_Password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_Password setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_Password setTextColor:[UIColor blackColor]];
    [textfield_Password setBackgroundColor:[UIColor clearColor]];
    [textfield_Password setPlaceholder:@"Password" ];
    [textfield_Password setValue:UIColorForBG
                   forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_Password setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_Password setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_Password setReturnKeyType:UIReturnKeyDone];
    [textfield_Password setUserInteractionEnabled:YES];
    textfield_Password.leftView = paddingView4;
    textfield_Password.leftViewMode = UITextFieldViewModeAlways;
    textfield_Password.secureTextEntry=YES;
    [self.view addSubview:textfield_Password];
    
    UIView *V4= [UIView new];
    V4.frame=CGRectMake(20, textfield_Password.frame.origin.y+Height, Width-40, 1);
    V4.backgroundColor=UIColorForBG;
    [self.view addSubview:V4];
    
    [textfield_CPassword setFrame:CGRectMake(0, from_X+4*Height, Width, Height)];
    [textfield_CPassword setDelegate:self];
    textfield_CPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_CPassword.clipsToBounds = YES;
    textfield_CPassword.textAlignment = NSTextAlignmentLeft;
    textfield_CPassword.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_CPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_CPassword setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_CPassword setTextColor:[UIColor blackColor]];
    [textfield_CPassword setBackgroundColor:[UIColor clearColor]];
    [textfield_CPassword setPlaceholder:@"Confirm Password" ];
    [textfield_CPassword setValue:UIColorForBG
                      forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_CPassword setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_CPassword setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_CPassword setReturnKeyType:UIReturnKeyDone];
    [textfield_CPassword setUserInteractionEnabled:YES];
    textfield_CPassword.leftView = paddingView5;
    textfield_CPassword.leftViewMode = UITextFieldViewModeAlways;
    textfield_CPassword.secureTextEntry=YES;
    [self.view addSubview:textfield_CPassword];
    
    UIView *V5= [UIView new];
    V5.frame=CGRectMake(20, textfield_CPassword.frame.origin.y+Height, Width-40, 1);
    V5.backgroundColor=UIColorForBG;
    [self.view addSubview:V5];
    
    
    [textfield_RefCode setFrame:CGRectMake(0, from_X+5*Height, Width, Height)];
    [textfield_RefCode setDelegate:self];
    textfield_RefCode.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_RefCode.clipsToBounds = YES;
    textfield_RefCode.textAlignment = NSTextAlignmentLeft;
    textfield_RefCode.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_RefCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_RefCode setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_RefCode setTextColor:[UIColor blackColor]];
    [textfield_RefCode setBackgroundColor:[UIColor clearColor]];
    [textfield_RefCode setPlaceholder:@"Referrer Code" ];
    [textfield_RefCode setValue:UIColorForBG
                       forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_RefCode setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_RefCode setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_RefCode setReturnKeyType:UIReturnKeyDone];
    [textfield_RefCode setUserInteractionEnabled:YES];
    textfield_RefCode.leftView = paddingView6;
    textfield_RefCode.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textfield_RefCode];
    
    UIView *V6= [UIView new];
    V6.frame=CGRectMake(20, textfield_RefCode.frame.origin.y+Height, Width-40, 1);
    V6.backgroundColor=UIColorForBG;
    [self.view addSubview:V6];
    
    
    UIImageView *TC=[UIImageView new];
    TC.frame=CGRectMake(50, HEIGH-90, Width-100, 30);
    [TC setImage:[UIImage imageNamed:@"TC@2x"]];
    [TC setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:TC];
    
    UIButton *btn_Login =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_Login.frame=CGRectMake(textfield_RefCode.frame.origin.x,self.view.frame.size.height-50,self.view.frame.size.width,50);
    [btn_Login setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    [btn_Login.titleLabel setFont:[UIFont fontWithName:KFontUsed size:14.0]];
    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal];
    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateHighlighted];
    [btn_Login setBackgroundColor:UIColorForBG];
    [[btn_Login layer] setCornerRadius:1.0f];
    btn_Login.layer.borderColor =[[UIColor blueColor] CGColor];
    [btn_Login addTarget:self action:@selector(btn_RegisterClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Login];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    if (delegate.flag==YES) {
           [self.navigationController popViewControllerAnimated:YES];
          delegate.flag=NO;
    }else{
    }
}


-(void)btn_RegisterClicked{
    
    [self integrateJWSlider];
    
//    [self resignKeyboard];
//    
//    if (textfield_FirstName.text.length <= 0) {
//        [SVProgressHUD showErrorWithStatus:@"Please fill in username."];
//    }
//    else if (textfield_Password.text.length < 2) {
//        
//        
//        if (textfield_Password.text.length <= 0)
//            [SVProgressHUD showErrorWithStatus:@"Please fill in password."];
//        else
//            [SVProgressHUD showErrorWithStatus:@"Password must be at least 2 characters."];
//        
//    }
//    else{
//       
//        [SVProgressHUD showErrorWithStatus:@"Please wait"];
//       // [self SignInWithUserName:txtFld_Email.text andPassword:txtFld_Password.text];
//    }
    
}

#pragma mark - JWSlider
-(void) integrateJWSlider{
    
    
    
    
    slideMenu = [[JWSlideMenuController alloc] init];
    
    JWSlideMenuViewController *tipsVC =[[NewServiceVC alloc]init];
    [slideMenu addViewController:tipsVC withTitle:@"" andImage:nil];
    
    JWSlideMenuViewController *serviceVC =[[ShareVC alloc]init];
    [slideMenu addViewController:serviceVC withTitle:@"" andImage:nil];
    
    JWSlideMenuViewController *coursesVC =[[SettingsVC alloc]init];
    [slideMenu addViewController:coursesVC withTitle:@"" andImage:nil];
    
    JWSlideMenuViewController *findPermaVC =[[LogoutVC alloc]init];
    [slideMenu addViewController:findPermaVC withTitle:@"" andImage:nil];
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    if (screenRect.size.height == 568)
    {
        [slideMenu.menuTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menu@2x.png"]]];
        
        // this is an iPhone 5+
    }else if (screenRect.size.height == 647)
    {
        [slideMenu.menuTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menu6@2x.png"]]];
        
        // this is an iPhone 6
    }else if (screenRect.size.height == 716)
    {
        [slideMenu.menuTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menu6plus@2x.png"]]];
        
        // this is an iPhone 6+
    }

    
    
     [self presentViewController:slideMenu animated:YES completion:nil];
    
    }





-(void)resignKeyboard{
    [textfield_Email resignFirstResponder];
    [textfield_Password resignFirstResponder];
}

-(void)btn_BackClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)btn_ClientClicked{
    
}

-(void)btn_ArtistClicked{
    
    SignUpArtist *vc = [SignUpArtist new];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    UINavigationController*  navController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         
                     }];
}
#pragma mark Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark textField Delegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
    static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
    static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
    static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 210;
    
    CGRect textFieldRect =
    [self.view convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view convertRect:self.view.bounds fromView:self.view];
    
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame;
    
    viewFrame= self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
    CGRect viewFrame;
    
    viewFrame= self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
    
    
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
