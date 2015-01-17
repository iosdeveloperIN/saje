//
//  FindWorkVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "FindWorkVC.h"
#import "Define.h"


@interface FindWorkVC ()

@end

@implementation FindWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BG@2x.png"]];
    
    UIImageView*   imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,self.view.frame.size.width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setImage:[UIImage imageNamed:@"NavigationBar@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 , Width, 25)];
    lbl_title.backgroundColor = [UIColor clearColor];
    lbl_title.textColor = [UIColor whiteColor];
    lbl_title.font = [UIFont fontWithName:KFontUsed size:15.0];
    lbl_title.text = @"Saje";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    UIImageView*   imageview_S = [[UIImageView alloc] init];
    imageview_S.frame=CGRectMake(0, 60,Width, 216);
    [imageview_S setUserInteractionEnabled:YES];
    [imageview_S setBackgroundColor:[UIColor clearColor]];
    [imageview_S setImage:[UIImage imageNamed:@"Photo@2x.png"]];
    [self.view addSubview:imageview_S];
    
    UIImageView*   imageview_C = [[UIImageView alloc] init];
    imageview_C.frame=CGRectMake(0, 60+216+30,Width, 250);
    [imageview_C setUserInteractionEnabled:YES];
    [imageview_C setBackgroundColor:[UIColor clearColor]];
    [imageview_C setImage:[UIImage imageNamed:@"Contact@2x.png"]];
    [self.view addSubview:imageview_C];
    
    
    
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
