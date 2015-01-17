//  ChangePasswordVC.m
//  CastingDB
//  Created by User1 on 02/04/14.
//  Copyright (c) 2014 User1. All rights reserved.

#import "ChangePasswordVC.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import "JWSlideMenuController.h"


@interface ChangePasswordVC ()<UITextFieldDelegate>
{
    

    
    UITextField *txtfield_OldPswrd;
    UITextField *txtfield_NewPswrd;
    UITextField *txtfield_ConfPswrd;
    UITextField *emailAlerttextfield;
}
@end

@implementation ChangePasswordVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIImageView * imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,Width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setBackgroundColor:[UIColor clearColor]];
    [imageview_TopBar setImage:[UIImage imageNamed:@"navbarCP@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 , Width, 25)];
    lbl_title.backgroundColor = [UIColor clearColor];
    lbl_title.textColor = [UIColor whiteColor];
    lbl_title.font = [UIFont fontWithName:KFontUsed size:14.0];
    lbl_title.text = @"Change Password";
    lbl_title.textAlignment = NSTextAlignmentCenter;
   // [self.view addSubview:lbl_title];
    
    
    
    
   
    
    UIButton *btn_Save =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_Save.frame=CGRectMake(self.view.frame.size.width-80,0,80,60);
   // [btn_Save setTitle:@"SAVE" forState:UIControlStateNormal];
   // [btn_Save.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:12.0]];
   // [btn_Save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [btn_Save setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn_Save setBackgroundColor:[UIColor clearColor]];
    [[btn_Save layer] setCornerRadius:0.0f];
    [btn_Save addTarget:self action:@selector(btn_SaveClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Save];
    
    
    
    UIView *view_LeftPadding1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    txtfield_OldPswrd = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    txtfield_OldPswrd.placeholder = @"Current Password";
    [txtfield_OldPswrd setValue:UIColorForBG
                forKeyPath:@"_placeholderLabel.textColor"];
    txtfield_OldPswrd.delegate = self;
    txtfield_OldPswrd.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtfield_OldPswrd.leftView = view_LeftPadding1;
    txtfield_OldPswrd.leftViewMode = UITextFieldViewModeAlways;
    [txtfield_OldPswrd setTextAlignment: NSTextAlignmentLeft];
  //  txtfield_OldPswrd.layer.borderColor = [[UIColor lightGrayColor] CGColor];
   // txtfield_OldPswrd.layer.borderWidth = 0.27;
    [txtfield_OldPswrd setFont:[UIFont fontWithName:KFontUsed size:15.0f]];
    [txtfield_OldPswrd setBackgroundColor:[UIColor clearColor]];
    [txtfield_OldPswrd setSecureTextEntry:YES];
  //  [txtfield_OldPswrd setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:txtfield_OldPswrd];
    
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(20,  txtfield_OldPswrd.frame.origin.y+40, Width-40, 1);
    V1.backgroundColor=UIColorForBG;
    [self.view addSubview:V1];
    
    UIView *view_LeftPadding2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    txtfield_NewPswrd = [[UITextField alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, 40)];
    txtfield_NewPswrd.placeholder = @"New Password";
    [txtfield_NewPswrd setValue:UIColorForBG
                forKeyPath:@"_placeholderLabel.textColor"];
    txtfield_NewPswrd.delegate = self;
    txtfield_NewPswrd.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtfield_NewPswrd.leftView = view_LeftPadding2;
    txtfield_NewPswrd.leftViewMode = UITextFieldViewModeAlways;
    [txtfield_NewPswrd setTextAlignment: NSTextAlignmentLeft];
   // txtfield_NewPswrd.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //txtfield_NewPswrd.layer.borderWidth = 0.30;
    [txtfield_NewPswrd setFont:[UIFont fontWithName:KFontUsed size:15.0f]];
    [txtfield_NewPswrd setSecureTextEntry:YES];
    [txtfield_NewPswrd setBackgroundColor:[UIColor clearColor]];
  //  [txtfield_NewPswrd setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:txtfield_NewPswrd];
    
    UIView *V2= [UIView new];
    V2.frame=CGRectMake(20,  txtfield_NewPswrd.frame.origin.y+40, Width-40, 1);
    V2.backgroundColor=UIColorForBG;
    [self.view addSubview:V2];
    
    UIView *view_LeftPadding3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    txtfield_ConfPswrd = [[UITextField alloc]initWithFrame:CGRectMake(0,180, self.view.frame.size.width, 40)];
    txtfield_ConfPswrd.placeholder = @"Confirm Password";
    [txtfield_ConfPswrd setValue:UIColorForBG
                forKeyPath:@"_placeholderLabel.textColor"];
    txtfield_ConfPswrd.delegate = self;
    txtfield_ConfPswrd.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtfield_ConfPswrd.leftView = view_LeftPadding3;
    txtfield_ConfPswrd.leftViewMode = UITextFieldViewModeAlways;
    txtfield_ConfPswrd.keyboardType = UIKeyboardTypeAlphabet;
    [txtfield_ConfPswrd setTextAlignment: NSTextAlignmentLeft];
 //   txtfield_ConfPswrd.layer.borderColor = [[UIColor lightGrayColor] CGColor];
   // txtfield_ConfPswrd.layer.borderWidth = 0.30;
    [txtfield_ConfPswrd setFont:[UIFont fontWithName:KFontUsed size:15.0f]];
    txtfield_ConfPswrd.userInteractionEnabled = YES;
    [txtfield_ConfPswrd setSecureTextEntry:YES];
    [txtfield_ConfPswrd setBackgroundColor:[UIColor clearColor]];
    //[txtfield_ConfPswrd setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:txtfield_ConfPswrd];
 
    UIView *V3= [UIView new];
    V3.frame=CGRectMake(20,  txtfield_ConfPswrd.frame.origin.y+40, Width-40, 1);
    V3.backgroundColor=UIColorForBG;
    [self.view addSubview:V3];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    
    [self.navigationController.slideMenuController HideHomeButton];

    
    
}
#pragma mark btn_BackClicked
-(void)btn_BackClicked{
    [self.navigationController popViewController];
}


#pragma mark btn_SaveClicked
-(void)btn_SaveClicked
{
    [self.view endEditing:YES];
    
    [self ValidationEnteries];
}

-(void)ValidationEnteries
{
    if([txtfield_OldPswrd.text length]<1)
    {
        [SVProgressHUD showErrorWithStatus:@"Please enter current password"];
    }
    else if([txtfield_NewPswrd.text length]<1)
    {
        [SVProgressHUD showErrorWithStatus:@"Please enter new password"];
    }
    else if([txtfield_ConfPswrd.text length]<1)
    {
        [SVProgressHUD showErrorWithStatus:@"Please re-enter password"];
    }
    else if([txtfield_OldPswrd.text length]<2)
    {
        [SVProgressHUD showErrorWithStatus:@"Current Password should be of minimum 2 characters"];
    }
    else if([txtfield_NewPswrd.text length]<2)
    {
        [SVProgressHUD showErrorWithStatus:@"New Password should be of minimum 2 characters"];
    }
    else if([txtfield_ConfPswrd.text length]<2)
    {
        [SVProgressHUD showErrorWithStatus:@"Confirm Password should be of minimum 2 characters"];
    }
    else if([txtfield_ConfPswrd.text length]>=2 && [txtfield_NewPswrd.text length]>=2 )
    {
        BOOL Succes = [self ValidateConfirmPassword];
        if(Succes)
           [self ChangePasswordfrom:txtfield_OldPswrd.text To:txtfield_NewPswrd.text];
    }
}

#pragma mark ValidateConfirmPassword
-(BOOL)ValidateConfirmPassword
{
    BOOL Password_Flag = FALSE;
    
    if(!([[txtfield_NewPswrd text] length] == [[txtfield_ConfPswrd text] length]))
    {
        [txtfield_NewPswrd setText:@""];
        [txtfield_ConfPswrd setText:@""];
        [SVProgressHUD showErrorWithStatus:@"Your password and confirm Password doesn't match"];
    }
    else {
        for(int x = 0; x < [[txtfield_NewPswrd text] length];x++)
        {
            if([txtfield_NewPswrd.text characterAtIndex:x] != [txtfield_ConfPswrd.text characterAtIndex:x])
            {
                [txtfield_NewPswrd setText:@""];
                [txtfield_ConfPswrd setText:@""];
                [SVProgressHUD showErrorWithStatus:@"Your password and confirm Password doesn't match"];
                Password_Flag = NO;
                break;
            }
            else {
                Password_Flag = YES;
            }
        }
    }
    return  Password_Flag;
}

#pragma mark Text Field Delegate Methods
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return TRUE;
}

#pragma mark Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Change Password
-(void)ChangePasswordfrom :(NSString *) oldPass To:(NSString *) newPass {
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@?tag=%@&old_password=%@&new_password=%@",kBaseUrl,kLoginAPI,@"changepass",oldPass,newPass];
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    
    // Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setHTTPMethod:@"GET"];
    

    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        //      NSLog(@"ERROR = %@",error.localizedDescription);
        
        
        
        if(error.localizedDescription == NULL)
        {
            
           
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if ([dict count] > 0 ) {
                if ([[dict objectForKey:@"success"] intValue] > 0) {
                    [self ResponseChangePassword:dict];
                }else{
                    [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",[dict objectForKey:@"error_msg"]]];

                }
            }
            else{
                [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",[dict objectForKey:@"error_msg"]]];
            }

            
        }
        else
        {
            
        }
    }];
    
    
    
}

-(void)ResponseChangePassword:(NSDictionary *)dict{
    
    [SVProgressHUD showSuccessWithStatus:@"Password changed"];
   // [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
