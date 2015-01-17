//
//  ViewController.m
//  Saje
//
//  Created by Nagendra Tripathi on 12/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
//    UIButton *btn_Skip;
//    NSString *str_LaunchingImage;

    
   // UIButton  *btn_Login;
}
@end

@implementation ViewController

//- (id)init
//{
//    self = [super initWithNibName:nil bundle:nil];
//    self.wantsFullScreenLayout = YES;
//    self.modalPresentationStyle = UIModalPresentationFullScreen;
//    return self;
//}

//- (void) loadView {
//    [super loadView];
//    
//    self.view.backgroundColor = [UIColor grayColor];
//    
//    str_LaunchingImage = @"na";
//    
//    UIImageView *Splash=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, IS_IPHONE_5 ? 568 :480)];
//    if( IS_IPHONE_5 )
//        [Splash setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Splash_IP5@2x" ofType:@"png"]]];
//    else
//        [Splash setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Splash_IP4@2x" ofType:@"png"]]];
//    [self.view addSubview:Splash];
//    
//    
//    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//    spinner.center = CGPointMake(160, IS_IPHONE_5? 390:365);
//    [Splash addSubview:spinner];
//    [spinner startAnimating];
//    
//        [self makeLunchingImage];
//    //[self GetIntroContents];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(void) makeLunchingImage{
//    
//    
//    NSData *imgData = [NSData dataWithData:UIImagePNGRepresentation([UIImage imageNamed:@"Splash_IP5@2x"])];
//    // From data to string
//    NSString *string = [[NSString alloc] initWithData:imgData encoding:NSUTF8StringEncoding];
//    
//    
//    IntroModel *model1 = [[IntroModel alloc] initWithTitle:@"" description:@"" image:string];
//    
//    IntroModel *model2 = [[IntroModel alloc] initWithTitle:@"" description:@"" image:string];
//    
//    self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[model1, model2]];
//    
//    
//    btn_Skip = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn_Skip.frame = CGRectMake(self.view.frame.size.width-100, self.view.frame.size.height-50, 100, 50);
//    btn_Skip.backgroundColor = [UIColor clearColor];
//    [btn_Skip setTitle:@"Skip >>" forState:UIControlStateNormal];
//    [btn_Skip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn_Skip addTarget:self action:@selector(click_DismissView) forControlEvents:UIControlEventTouchUpInside];
//   // [self.view addSubview:btn_Skip];
//    
//    UIButton *btn_Login =[UIButton buttonWithType:UIButtonTypeCustom];
//    btn_Login.frame=CGRectMake(90,self.view.frame.size.height-100,50,30);
//    [btn_Login setTitle:@"Log In" forState:UIControlStateNormal];
//    [btn_Login.titleLabel setFont:[UIFont fontWithName:KFontUsed size:14.0]];
//    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal];
//    [btn_Login setTitleColor:[UIColor whiteColor ] forState:UIControlStateHighlighted];
//    [btn_Login setBackgroundColor:UIColorForBG];
//    [[btn_Login layer] setCornerRadius:1.0f];
//    btn_Login.layer.borderColor =[[UIColor blueColor] CGColor];
//    btn_Login.layer.cornerRadius=8.0;
//    [btn_Login addTarget:self action:@selector(click_Login) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn_Login];
//    
//    
//    UIButton *btn_SignUp =[UIButton buttonWithType:UIButtonTypeCustom];
//    btn_SignUp.frame=CGRectMake(170,self.view.frame.size.height-100,50,30);
//    [btn_SignUp setTitle:@"Sign Up" forState:UIControlStateNormal];
//    [btn_SignUp.titleLabel setFont:[UIFont fontWithName:KFontUsed size:14.0]];
//    [btn_SignUp setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal];
//    [btn_SignUp setTitleColor:[UIColor whiteColor ] forState:UIControlStateHighlighted];
//    [btn_SignUp setBackgroundColor:UIColorForBG];
//    [[btn_SignUp layer] setCornerRadius:1.0f];
//    btn_SignUp.layer.borderColor =[[UIColor blueColor] CGColor];
//    btn_SignUp.layer.cornerRadius=8.0;
//    [btn_SignUp addTarget:self action:@selector(click_SignUp) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn_SignUp];
//    
//    
//    
//}


//-(void) click_DismissView{
//    AppDelegate *mAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [mAppDelegate click_HideIntro];
//}

//-(void) click_Login{
//    LoginVC *vc=[LoginVC new];
//    [self.navigationController pushViewController:vc animated:YES];
//
//}
//-(void) click_SignUp{
//    SignUpVC *vc=[SignUpVC new];
//    [self.navigationController pushViewController:vc animated:YES];
//    
//}
//
//#pragma mark - Get Intro Contents
//-(void)GetIntroContents{
//    
//    
//    NSString *urlString = [NSString stringWithFormat:@"%@", @"11" ];
//    NSLog(@"urlString is ≥≥≥ %@", urlString);
//    NSURL *requestURL = [NSURL URLWithString:urlString];
//    
//    
//    // Request
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:requestURL];
//    [request setHTTPMethod:@"GET"];
//    
//    
//    [NSURLConnection sendAsynchronousRequest:request                                  queue:[NSOperationQueue mainQueue]
//     
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                               
//                               NSLog(@"ERROR = %@",error.localizedDescription);
//                               
//                               
//                               if(error.localizedDescription == NULL)
//                               {
//                                   
//                                   NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                   NSLog(@"response >>>>>>>>> succ %@",returnString);
//                                   [self ResponseDetail:data];
//                               }
//                               else
//                               {
//                                   NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                   NSLog(@"response >>>>>>>>> fail %@",returnString);
//                               }
//                           }];
//}
//-(void)ResponseDetail:(NSData *)data{
//    
//    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//    NSLog(@"OUTPUT ≥≥≥ %@",dict);
//    
//    if ([[dict valueForKey:@"msg"] isEqualToString:@"OK"]) {
//        str_LaunchingImage = [dict objectForKey:@"launching_image"];
//        //[self makeLunchingImage];
//    }
//    else{
//        //[SVProgressHUD showErrorWithStatus:[dict objectForKey:@"msg"] ];
//    }
//    
//    
//}


-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
