//
//  PortfolioVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "PortfolioVC.h"
#import "Define.h"
#import "SVProgressHUD.h"
#import "JWSlideMenuController.h"
#import "EditPortVC.h"
#import "AddPortVC.h"


@interface PortfolioVC ()
{
      UISegmentedControl *segmentedControl;
    UILabel *lbl_Edit;
}
@end

@implementation PortfolioVC

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
    lbl_title.text = @"Profile";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    
    
    lbl_Edit = [[UILabel alloc]initWithFrame:CGRectMake(Width-80, 25 , 80, 25)];
    lbl_Edit.backgroundColor = [UIColor clearColor];
    lbl_Edit.textColor = [UIColor whiteColor];
    lbl_Edit.font = [UIFont fontWithName:KFontUsed size:13.0];
    lbl_Edit.text = @"EDIT";
    lbl_Edit.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_Edit];
    
    
    UIButton *btn_Edit =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_Edit.frame=CGRectMake(Width-100,0,100,60);
    [btn_Edit setBackgroundColor:[UIColor clearColor]];
    [[btn_Edit layer] setCornerRadius:0.0f];
    [btn_Edit addTarget:self action:@selector(btn_EditClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Edit];
    
    
    
    
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    
    UIImageView*   imageview_CP = [[UIImageView alloc] init];
    imageview_CP.frame=CGRectMake(0, 60,Width, 220);
    [imageview_CP setUserInteractionEnabled:YES];
    [imageview_CP setBackgroundColor:[UIColor clearColor]];
    [imageview_CP setImage:[UIImage imageNamed:@"Profile_zone@2x.png"]];
    [self.view addSubview:imageview_CP];
    
   NSArray* itemArray = [NSArray arrayWithObjects: @"About", @"Portfolio", nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(10, 300, Width-20, 30);
    [segmentedControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [[UISegmentedControl appearance] setTintColor:UIColorForBG];
    [self.view addSubview:segmentedControl];

    
    
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

-(void)btn_EditClicked{
    
}


-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0:{
            //action for the first button (Current)
            lbl_Edit.text = @"EDIT";
            EditPortVC *vc=[EditPortVC new];
            [self.navigationController pushViewController:vc];

            break;}
        case 1:{
            //action for the first button (Current)
            lbl_Edit.text = @"+";
            AddPortVC *vc=[AddPortVC new];
            [self.navigationController pushViewController:vc];

            break;}
    }
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
