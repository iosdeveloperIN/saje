//
//  LoginVC.m
//  Scavenger Hunt
//
//  Created by User on 16/05/14.
//  Copyright (c) 2014 Anonymous. All rights reserved.
//

#import "LoginVC.h"
#import "AppDelegate.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import "SignUpVC.h"


@interface LoginVC ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField  *txtFld_Email;
    UITextField  *txtFld_Password;
    UIView *V3;
    
    UIActivityIndicatorView *activityIndicator;

    
}
@end

@implementation LoginVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];


#define Height 40
#define from_X 100
    
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
    lbl_title.text = @"Log In";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    
    //Email Field
    
    txtFld_Email = [[UITextField alloc]init];
    [txtFld_Email setFrame:CGRectMake(0, from_X, Width, Height)];
    [txtFld_Email setDelegate:self];
    txtFld_Email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtFld_Email.clipsToBounds = YES;
    txtFld_Email.textAlignment = NSTextAlignmentLeft;
    txtFld_Email.autocorrectionType=UITextAutocorrectionTypeNo;
    txtFld_Email.clearButtonMode = UITextFieldViewModeWhileEditing;
    [txtFld_Email setFont:[UIFont systemFontOfSize:15.0f]];
    [txtFld_Email setTextColor:[UIColor blackColor]];
    [txtFld_Email setBackgroundColor:[UIColor clearColor]];
    [txtFld_Email setPlaceholder:@"Email" ];
    [txtFld_Email setValue:UIColorForBG
                   forKeyPath:@"_placeholderLabel.textColor"];
    [txtFld_Email setFont:[UIFont fontWithName: KFontUsed size:15]];
    [txtFld_Email setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [txtFld_Email setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [txtFld_Email setReturnKeyType:UIReturnKeyDone];
    [txtFld_Email setUserInteractionEnabled:YES];
    [self.view addSubview:txtFld_Email];
    
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    txtFld_Email.leftView = paddingView1;
    txtFld_Email.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(20,  txtFld_Email.frame.origin.y+Height, Width-40, 1);
    V1.backgroundColor=UIColorForBG;
    [self.view addSubview:V1];
    
    
    
    
    
    //Password Field
    
    txtFld_Password = [[UITextField alloc]init];
    [txtFld_Password setFrame:CGRectMake(0, from_X+Height,Width, Height)];
    [txtFld_Password setDelegate:self];
    txtFld_Password.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtFld_Password.clipsToBounds = YES;
    txtFld_Password.textAlignment = NSTextAlignmentLeft;
    txtFld_Password.secureTextEntry = YES;
    [txtFld_Password setFont:[UIFont systemFontOfSize:15.0f]];
    [txtFld_Password setTextColor:[UIColor blackColor]];
    [txtFld_Password setBackgroundColor:[UIColor clearColor]];
    [txtFld_Password setPlaceholder:@"Password" ];
    [txtFld_Password setValue:UIColorForBG
                       forKeyPath:@"_placeholderLabel.textColor"];
    [txtFld_Password setFont:[UIFont fontWithName: KFontUsed size:15]];
    [txtFld_Password setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [txtFld_Password setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [txtFld_Password setReturnKeyType:UIReturnKeyDone];
    [txtFld_Password setUserInteractionEnabled:YES];
    [self.view addSubview:txtFld_Password];
    
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    txtFld_Password.leftView = paddingView2;
    txtFld_Password.leftViewMode = UITextFieldViewModeAlways;

    
    UIView *V2= [UIView new];
    V2.frame=CGRectMake(20,  txtFld_Password.frame.origin.y+Height, Width-40, 1);
    V2.backgroundColor=UIColorForBG;
    [self.view addSubview:V2];
    
    V3= [UIView new];
    V3.frame=CGRectMake(0,  self.view.frame.size.height-210, Width, 210);
    V3.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:V3];
    
    
    UIButton *btn_Login =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_Login.frame=CGRectMake(20,txtFld_Password.frame.origin.y+2*Height,Width-40,40);
    [btn_Login setTitle:@"LOG IN" forState:UIControlStateNormal];
    [btn_Login.titleLabel setFont:[UIFont fontWithName:KFontUsed size:14.0]];
    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal];
    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateHighlighted];
    [btn_Login setBackgroundColor:UIColorForBG];
    [[btn_Login layer] setCornerRadius:1.0f];
    btn_Login.layer.borderColor =[[UIColor blueColor] CGColor];
    btn_Login.layer.cornerRadius=8.0;
    [btn_Login addTarget:self action:@selector(btn_LoginClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Login];
    
    
    
//Button Reset Password

    UIButton *btn_ResetPass =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_ResetPass.frame=CGRectMake(0,self.view.frame.size.height-45,self.view.frame.size.width,45);
    [btn_ResetPass setTitle:@"RESET PASSWORD" forState:UIControlStateNormal];
    [btn_ResetPass.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:12.0]];
    [btn_ResetPass setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_ResetPass setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn_ResetPass setBackgroundColor:UIColorForButton];
    [[btn_ResetPass layer] setCornerRadius:0.0f];
    [btn_ResetPass addTarget:self action:@selector(btn_ResetPassClicked) forControlEvents:UIControlEventTouchUpInside];
  //  [self.view addSubview:btn_ResetPass];
    
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, IS_IPHONE_5?330:300, 10, 10)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    
    
}



-(void)btn_ResetPassClicked{
    
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"To reset your password, please type your email"];
    [dialog setMessage:@" "];
    [dialog addButtonWithTitle:@"Cancel"];
    [dialog addButtonWithTitle:@"Reset"];
    dialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    [dialog textFieldAtIndex:0].keyboardType = UIKeyboardTypeAlphabet;
    [[dialog textFieldAtIndex:0] setDelegate:self];
    
    CGAffineTransform moveUp = CGAffineTransformMakeTranslation(0.0, 0.0);
    [dialog setTransform: moveUp];
    [dialog show];

}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    

    
    if (buttonIndex == 1) {
        
        UITextField *myTemptextfield;
        myTemptextfield = [alertView textFieldAtIndex:0];
        
        
        if ([myTemptextfield.text length] <= 0) {
            [SVProgressHUD showErrorWithStatus:@"Cannot send empty email"];
            
        }
        else{
            
            
            [self ResetPasswordofUser:myTemptextfield.text];
            
        }
        
    }
    else if(buttonIndex == 0){
        
        [[alertView textFieldAtIndex:0] setText:@""];
        
    }
}


#pragma mark - API CALL RESET PASS

-(void) ResetPasswordofUser:(NSString *) str_Email{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@?tag=%@&email=%@",kBaseUrl,kLoginAPI,@"reset",str_Email];
    
    NSLog(@"%@",urlString);
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    
    // Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setHTTPMethod:@"GET"];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        
        [activityIndicator stopAnimating];
        
        if(error.localizedDescription == NULL)
        {
      
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if ([dict count] > 0 ) {
                if ([[dict objectForKey:@"success"] intValue] > 0) {
                    [self ResponseResetPass:dict];
                }
            }
            else{
                [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",[dict objectForKey:@"error_msg"]]];
            }
            
            
        }
        else
        {
            
            [SVProgressHUD showErrorWithStatus:@"Error in login. Try again"];
            
            
        }
    }];
    
    
    
}

-(void)ResponseResetPass:(NSDictionary *)dict{
    
     [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",[dict valueForKey:@"message"]]];
    
}

-(void)btn_BackClicked{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)btn_LoginClicked{
    
    SignUpVC *vc=[SignUpVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
// [self resignKeyboard];
//    
//    if (txtFld_Email.text.length <= 0) {
//        [SVProgressHUD showErrorWithStatus:@"Please fill in username."];
//    }
//    else if (txtFld_Password.text.length < 2) {
//        
//        
//        if (txtFld_Password.text.length <= 0)
//            [SVProgressHUD showErrorWithStatus:@"Please fill in password."];
//        else
//            [SVProgressHUD showErrorWithStatus:@"Password must be at least 2 characters."];
//        
//    }
//    else{
//        [activityIndicator startAnimating];
//        [SVProgressHUD showErrorWithStatus:@"Please wait"];
//        //[self SignInWithUserName:txtFld_Email.text andPassword:txtFld_Password.text];
//    }
//    
}


-(void)btn_CancelClicked{
    
    [self resignKeyboard];
    

    
}

#pragma mark - API CALL LOGIN


-(void)SignInWithUserName:(NSString *) UserName andPassword:(NSString *) Password{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@?tag=%@&username=%@&password=%@",kBaseUrl,kLoginAPI,@"login",UserName,Password];
    
    NSLog(@"%@",urlString);
    
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    
    // Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setHTTPMethod:@"GET"];
    
 
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
       
        [activityIndicator stopAnimating];
        
        if(error.localizedDescription == NULL)
        {
            
//              NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                     NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if ([dict count] > 0 ) {
                if ([[dict objectForKey:@"success"] intValue] > 0) {
                    [self ResponseSignIN:dict];
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
            
            [SVProgressHUD showErrorWithStatus:@"Error in login. Try again"];
            
            
        }
    }];
    
    
    
}

-(void)ResponseSignIN:(NSDictionary *)dict{
    
 //  [(AppDelegate *) [[UIApplication sharedApplication] delegate] RegisterMyDevice];

    
//    CategoriesVC *vc = [[CategoriesVC alloc]init];
//    vc.userName =[[dict valueForKey:@"user"]valueForKey:@"username"];
//    [self.navigationController pushViewController:vc animated:YES];
    
}




        
        
        
-(void)resignKeyboard{
    [txtFld_Email resignFirstResponder];
    [txtFld_Password resignFirstResponder];
}


#pragma mark textField Delegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
  //  [V3 setBackgroundColor:UIColorForBG];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
     //   [V3 setBackgroundColor:[UIColor whiteColor]];
   
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



#pragma mark Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
