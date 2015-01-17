//
//  MyProfileVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "MyProfileVC.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import "JWSlideMenuController.h"
#import "ChangePhotoVC.h"



@interface MyProfileVC ()<UITextFieldDelegate>
{
    UIScrollView *ScrollMain;
    
    UITextField  *textfield_Name;
    UITextField  *textfield_UserName;
    UITextField  *textfield_Email;
    UITextField  *textfield_Phone;

}
@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView*   imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,self.view.frame.size.width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setImage:[UIImage imageNamed:@"nav bar@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 , Width, 25)];
    lbl_title.backgroundColor = [UIColor clearColor];
    lbl_title.textColor = [UIColor whiteColor];
    lbl_title.font = [UIFont fontWithName:KFontUsed size:15.0];
    lbl_title.text = @"Edit Profile";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    
    
    UIImageView*   imageview_CA = [[UIImageView alloc] init];
    imageview_CA.frame=CGRectMake(0, 60,Width, 30);
    [imageview_CA setUserInteractionEnabled:YES];
    [imageview_CA setBackgroundColor:[UIColor clearColor]];
    [imageview_CA setImage:[UIImage imageNamed:@"ChangeAvatar@2x.png"]];
    [self.view addSubview:imageview_CA];
    
    UIImageView*   imageview_CP = [[UIImageView alloc] init];
    imageview_CP.frame=CGRectMake(0, 90,Width, 220);
    [imageview_CP setUserInteractionEnabled:YES];
    [imageview_CP setBackgroundColor:[UIColor clearColor]];
    [imageview_CP setImage:[UIImage imageNamed:@"CoverPhoto@2x.png"]];
    [self.view addSubview:imageview_CP];
    
    
    UIButton *btn_ChangePic =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_ChangePic.frame=CGRectMake(0,0,Width,220);
    [btn_ChangePic setBackgroundColor:[UIColor clearColor]];
    [[btn_ChangePic layer] setCornerRadius:0.0f];
    [btn_ChangePic addTarget:self action:@selector(btn_ChangePicClicked) forControlEvents:UIControlEventTouchUpInside];
    [imageview_CP addSubview:btn_ChangePic];

    
    ScrollMain = [[UIScrollView alloc]initWithFrame:CGRectMake( 0, 310, Width, self.view.frame.size.height-50)];
    [ScrollMain setContentSize:CGSizeMake(Width, self.view.frame.size.height+50)];
    [ScrollMain setShowsVerticalScrollIndicator:YES];
    //    ScrollMain.layer.borderWidth = 2.0;
    //    ScrollMain.layer.borderColor = [[UIColor greenColor] CGColor];
    [ScrollMain setBounces:YES];
    [self.view addSubview:ScrollMain];
    
    
    UIImageView*   imageview_PI = [[UIImageView alloc] init];
    imageview_PI.frame=CGRectMake(0, 0,Width, 30);
    [imageview_PI setUserInteractionEnabled:YES];
    [imageview_PI setBackgroundColor:[UIColor clearColor]];
    [imageview_PI setImage:[UIImage imageNamed:@"PersonalInfo@2x.png"]];
    [ScrollMain addSubview:imageview_PI];
    

    
    
    UIImageView*   imageview_1 = [[UIImageView alloc] init];
    imageview_1.frame=CGRectMake(0, 0+30,Width, 60);
    [imageview_1 setUserInteractionEnabled:YES];
    [imageview_1 setBackgroundColor:[UIColor clearColor]];
    [imageview_1 setImage:[UIImage imageNamed:@"Label1@2x.png"]];
    [ScrollMain addSubview:imageview_1];
    
    UIImageView*   imageview_2 = [[UIImageView alloc] init];
    imageview_2.frame=CGRectMake(0, 0+90,Width, 60);
    [imageview_2 setUserInteractionEnabled:YES];
    [imageview_2 setBackgroundColor:[UIColor clearColor]];
    [imageview_2 setImage:[UIImage imageNamed:@"Label2@2x.png"]];
    [ScrollMain addSubview:imageview_2];
    
    UIImageView*   imageview_3 = [[UIImageView alloc] init];
    imageview_3.frame=CGRectMake(0, 150,Width, 60);
    [imageview_3 setUserInteractionEnabled:YES];
    [imageview_3 setBackgroundColor:[UIColor clearColor]];
    [imageview_3 setImage:[UIImage imageNamed:@"Label3@2x.png"]];
    [ScrollMain addSubview:imageview_3];
    
    UIImageView*   imageview_4 = [[UIImageView alloc] init];
    imageview_4.frame=CGRectMake(0, 210,Width, 60);
    [imageview_4 setUserInteractionEnabled:YES];
    [imageview_4 setBackgroundColor:[UIColor clearColor]];
    [imageview_4 setImage:[UIImage imageNamed:@"Label3@2x.png"]];
    [ScrollMain addSubview:imageview_4];
    
    
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    textfield_Name      = [[UITextField alloc]init];
    textfield_UserName  = [[UITextField alloc]init];
    textfield_Email     = [[UITextField alloc]init];
    textfield_Phone     = [[UITextField alloc]init];
    
#define Height 60
#define from_X 30
#define HEIGH  self.view.frame.size.height
    
    [textfield_Name setFrame:CGRectMake(80, from_X, Width-100, Height)];
    [textfield_Name setDelegate:self];
    textfield_Name.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_Name.clipsToBounds = YES;
    textfield_Name.textAlignment = NSTextAlignmentRight;
    textfield_Name.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_Name.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_Name setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_Name setTextColor:[UIColor blackColor]];
    [textfield_Name setBackgroundColor:[UIColor clearColor]];
    [textfield_Name setPlaceholder:@"Name" ];
    [textfield_Name setValue:UIColorForBG
                      forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_Name setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_Name setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_Name setReturnKeyType:UIReturnKeyDone];
    [textfield_Name setUserInteractionEnabled:YES];
    textfield_Name.leftView = paddingView1;
    textfield_Name.leftViewMode = UITextFieldViewModeAlways;
    [ScrollMain addSubview:textfield_Name];
    
   
    [textfield_UserName setFrame:CGRectMake(80, from_X+Height, Width-100, Height)];
    [textfield_UserName setDelegate:self];
    textfield_UserName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_UserName.clipsToBounds = YES;
    textfield_UserName.textAlignment = NSTextAlignmentRight;
    textfield_UserName.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_UserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_UserName setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_UserName setTextColor:[UIColor blackColor]];
    [textfield_UserName setBackgroundColor:[UIColor clearColor]];
    [textfield_UserName setPlaceholder:@"User Name" ];
    [textfield_UserName setValue:UIColorForBG
                  forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_UserName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_UserName setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_UserName setReturnKeyType:UIReturnKeyDone];
    [textfield_UserName setUserInteractionEnabled:YES];
    textfield_UserName.leftView = paddingView2;
    textfield_UserName.leftViewMode = UITextFieldViewModeAlways;
    [ScrollMain addSubview:textfield_UserName];
    
    
    
    [textfield_Email setFrame:CGRectMake(80, from_X+2*Height, Width-100, Height)];
    [textfield_Email setDelegate:self];
    textfield_Email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_Email.clipsToBounds = YES;
    textfield_Email.textAlignment = NSTextAlignmentRight;
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
    [ScrollMain addSubview:textfield_Email];
    

    
    
    [textfield_Phone setFrame:CGRectMake(80, from_X+3*Height, Width-100, Height)];
    [textfield_Phone setDelegate:self];
    textfield_Phone.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_Phone.clipsToBounds = YES;
    textfield_Phone.textAlignment = NSTextAlignmentRight;
    textfield_Phone.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_Phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_Phone setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_Phone setTextColor:[UIColor blackColor]];
    [textfield_Phone setBackgroundColor:[UIColor clearColor]];
    [textfield_Phone setPlaceholder:@"Phone" ];
    [textfield_Phone setValue:UIColorForBG
                      forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_Phone setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_Phone setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_Phone setReturnKeyType:UIReturnKeyDone];
    [textfield_Phone setUserInteractionEnabled:YES];
    textfield_Phone.leftView = paddingView4;
    textfield_Phone.leftViewMode = UITextFieldViewModeAlways;
    textfield_Phone.secureTextEntry=YES;
    [ScrollMain addSubview:textfield_Phone];
    
   
    
    
    

}

-(void)viewWillAppear:(BOOL)animated{
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    [self.navigationController.slideMenuController HideHomeButton];
}

-(void)btn_BackClicked{
    [self.navigationController popViewController];
}

-(void)btn_ChangePicClicked{
    
    ChangePhotoVC *vc=[ChangePhotoVC new];
    [self.navigationController pushViewController:vc];
    
}

#pragma mark - TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (IS_IPHONE_5) {
        if ([textField isEqual:textfield_Name])
            [ScrollMain setContentOffset:CGPointMake(0, 60) animated:YES];
        else if ([textField isEqual:textfield_UserName])
            [ScrollMain setContentOffset:CGPointMake(0, 110) animated:YES];
        else if ([textField isEqual:textfield_Email])
            [ScrollMain setContentOffset:CGPointMake(0, 160) animated:YES];
        else if ([textField isEqual:textfield_Phone])
            [ScrollMain setContentOffset:CGPointMake(0, 220) animated:YES];
           }
   
    
}



-(void)textFieldDidEndEditing:(UITextField *)textField    {
    
    [ScrollMain setContentOffset:CGPointMake(0, 0) animated:YES];
    
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
