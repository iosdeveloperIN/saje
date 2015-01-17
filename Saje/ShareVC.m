//
//  ShareVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 12/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "ShareVC.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ShareVC ()<MFMailComposeViewControllerDelegate>

@end

@implementation ShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Share";
    
    UIImageView*   imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,self.view.frame.size.width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setImage:[UIImage imageNamed:@"NavigationBar@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    
    UIImageView*   imageview_S = [[UIImageView alloc] init];
    imageview_S.frame=CGRectMake(40, 90,Width-80, 218);
    [imageview_S setUserInteractionEnabled:YES];
    [imageview_S setBackgroundColor:[UIColor clearColor]];
    [imageview_S setImage:[UIImage imageNamed:@"ContactShare@2x.png"]];
    [self.view addSubview:imageview_S];
    
    UIImageView*   imageview_C = [[UIImageView alloc] init];
    imageview_C.frame=CGRectMake(10, 60+218+60,Width-20, 55);
    [imageview_C setUserInteractionEnabled:YES];
    [imageview_C setBackgroundColor:[UIColor clearColor]];
    [imageview_C setImage:[UIImage imageNamed:@"GroupShare@2x.png"]];
    [self.view addSubview:imageview_C];
    
    
    UIImageView*   imageview_CopyBack = [[UIImageView alloc] init];
    imageview_CopyBack.frame=CGRectMake(0,60+218+50+130,Width, 100);
    [imageview_CopyBack setUserInteractionEnabled:YES];
    [imageview_CopyBack setBackgroundColor:[UIColor clearColor]];
    [imageview_CopyBack setImage:[UIImage imageNamed:@"BGCopy@2x.png"]];
    [self.view addSubview:imageview_CopyBack];

    
    
    UIImageView*   imageview_Copy = [[UIImageView alloc] init];
    imageview_Copy.frame=CGRectMake(110, 60,Width-220, 30);
    [imageview_Copy setUserInteractionEnabled:YES];
    [imageview_Copy setBackgroundColor:[UIColor clearColor]];
    [imageview_Copy setImage:[UIImage imageNamed:@"Copy@2x.png"]];
    [imageview_CopyBack addSubview:imageview_Copy];

    
    UIButton *btn_Copy=[[UIButton alloc]initWithFrame:CGRectMake(100, 60,100, 30)];
    [btn_Copy addTarget:self action:@selector(btn_CopyClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Copy setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Copy];
    
    
    UIButton *FBButton = [[UIButton alloc] initWithFrame:CGRectMake(40, IS_IPHONE_5 ? 350 : 355, 45, 45)];
   // [FBButton setImage:[UIImage imageNamed:@"facebook@2x.png"] forState:UIControlStateNormal];
    [FBButton setUserInteractionEnabled:YES];
    [FBButton setBackgroundColor:[UIColor clearColor]];
    [FBButton addTarget:self action:@selector(FBButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FBButton];

    
    UIButton *TWButton = [[UIButton alloc] initWithFrame:CGRectMake(110, IS_IPHONE_5 ? 350 : 350, 50, 50)];
   // [TWButton setImage:[UIImage imageNamed:@"twitter@2x.png"] forState:UIControlStateNormal];
    [TWButton setUserInteractionEnabled:YES];
    [TWButton setBackgroundColor:[UIColor clearColor]];
    [TWButton addTarget:self action:@selector(TWButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:TWButton];
    
    
    
    UIButton *SMSButton = [[UIButton alloc] initWithFrame:CGRectMake(200, IS_IPHONE_5 ? 350 : 360, 40, 40)];
   // [SMSButton setImage:[UIImage imageNamed:@"email@2x.png"] forState:UIControlStateNormal];
    [SMSButton setUserInteractionEnabled:YES];
    [SMSButton setBackgroundColor:[UIColor clearColor]];
    [SMSButton addTarget:self action:@selector(SMSButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SMSButton];

    
    UIButton *MailButton = [[UIButton alloc] initWithFrame:CGRectMake(280, IS_IPHONE_5 ? 350 : 350, 50, 50)];
   // [MailButton setImage:[UIImage imageNamed:@"browser@2x.png"] forState:UIControlStateNormal];
    [MailButton setUserInteractionEnabled:YES];
    [MailButton setBackgroundColor:[UIColor clearColor]];
    [MailButton addTarget:self action:@selector(EmailButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MailButton];


    
    
    
    
}

-(void)btn_CopyClicked{
    [SVProgressHUD showErrorWithStatus:@"Under construction"];
}
#pragma mark - FBButtonClicked

-(void)FBButtonClicked{
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result)
        {
            [facebook dismissViewControllerAnimated:YES completion:Nil];
        };
        facebook.completionHandler =myBlock;
        
        [facebook addImage:[UIImage imageNamed:@"Icon.png"]];
        [facebook setInitialText:@"Check out the Sage App.It's amazing.Download this cool app from itunes"];
        [facebook addURL:[NSURL URLWithString:@"http://www.enchantedsparetreat.com"]];
        
        [self presentViewController:facebook animated:YES completion:nil];
        
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:@"You can't send a share right now, make sure your device has an internet connection and you have at least one facebook account setup"];
        
        //        UIImage *postImage = [UIImage imageNamed:@"p_Beach.png"];
        //        NSArray *activityItems = @[@"hi", postImage];
        //        UIActivityViewController *activityController =
        //        [[UIActivityViewController alloc]
        //         initWithActivityItems:activityItems applicationActivities:nil];
        //        [self presentViewController:activityController
        //                           animated:YES completion:nil];
        
    }
    
}

#pragma mark - TwitterButtonClicked

-(void)TWButtonClicked{
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        // Create a compose view controller for the service type Twitter
        SLComposeViewController *mulitpartPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        // Set the text of the tweet
        [mulitpartPost setInitialText:@"Check out the Sage App.It's amazing.Download this cool app from itunes.For More visit us"];
        
        // Create the image to post with the tweet
        UIImage *imageToTweet = [UIImage imageNamed:@"Icon.png"];
        
        // Add the image to the tweet
        [mulitpartPost addImage:imageToTweet];
        
        // Display the tweet sheet to the user
        [self presentViewController:mulitpartPost animated:YES completion:nil];
        
        // Tidy up
        mulitpartPost = nil;
        imageToTweet = nil;
        
        
        
    }
    else
    {
        
        [SVProgressHUD showErrorWithStatus:@"You can't send a share right now, make sure your device has an internet connection and you have at least one Twitter account setup"];
        
        //        [self callAlertView:@"Sorry" message:@"You can't send a share right now, make sure your device has an internet connection and you have at least one Twitter account setup"];
    }
    

    
    
}

#pragma mark - EmailButtonClicked

-(void)EmailButtonClicked{
    
    
    //create new instane of MFMailComposeViewController
    MFMailComposeViewController* mc = [[MFMailComposeViewController alloc] init];
    //set delegate
    mc.mailComposeDelegate = self;
    mc.navigationBar.tintColor=[UIColor colorWithRed:103.0f/255 green:180.0f/255 blue:95.0f/255 alpha:1.0f];
    //set message body
    [mc setMessageBody:@"Invite your friends @ CHAT iPhone App /n http://www.abcd.com" isHTML:NO];
    //set message subject
    //  [mc setSubject:];
    
    //set message recipients
    // [mc setToRecipients:[NSArray arrayWithObject:email]];
    
    //open dialog
    [self presentViewController:mc animated:YES completion:nil];
    
    
    
}


//-(void)makeAlert:(NSString *)message{
//    [[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//}


#pragma mark - mail composer delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    //if result is possible
    if(result == MFMailComposeResultSent || result == MFMailComposeResultSaved || result == MFMailComposeResultCancelled){
        
        //test result and show alert
        switch (result) {
            case MFMailComposeResultCancelled:
                // [self makeAlert:@"Result Cancelled"];
                break;
            case MFMailComposeResultSaved:
                //[self makeAlert:@"Result saved"];
                break;
                //message was sent
            case MFMailComposeResultSent:
                
                
                
                //                for (int x=0; x<[emailArray count]-1; x++) {
                //                    NSLog(@"%d). %@",x+1,[emailArray objectAtIndex:x]);
                //                    NSString *element = [emailArray objectAtIndex:x];
                //                    NSArray *arr = [element componentsSeparatedByString:@" & "];
                //                    if ([arr count]==1) {
                //                       // ++emailCount;
                //                    }
                //                    else{
                //                        int more = [[[arr objectAtIndex:1] substringToIndex:1] intValue];
                //                      //  emailCount+=(more+1);
                //                    }
                //                }
                
                //[self makeAlert:@"Result Sent"];
                
                break;
            case MFMailComposeResultFailed:
                // [self makeAlert:@"Result Failed"];
                break;
            default:
                break;
        }
    }
    //else exists error
    else if(error != nil){
        //show error
       // [self makeAlert:[error localizedDescription]];
    }
    
    //dismiss view
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - SMSButtonClicked

-(void)SMSButtonClicked{
    
        [SVProgressHUD showErrorWithStatus:@"Under construction"];
    
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
