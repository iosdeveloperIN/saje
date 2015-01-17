//
//  SettingsArtVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "SettingsArtVC.h"
#import "Define.h"
#import "ChangePasswordVC.h"
#import "JWSlideMenuController.h"
#import "MyProfileVC.h"
#import "PortfolioVC.h"


@interface SettingsArtVC ()<UITableViewDataSource,UITableViewDelegate>
{
        UITableView *tableForMainSetting;
}
@end

@implementation SettingsArtVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView*   imageview_TopBar = [[UIImageView alloc] init];
    imageview_TopBar.frame=CGRectMake(0, 0,self.view.frame.size.width, 60);
    [imageview_TopBar setUserInteractionEnabled:YES];
    [imageview_TopBar setImage:[UIImage imageNamed:@"NavigationBar@2x.png"]];
    [self.view addSubview:imageview_TopBar];
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 25 , Width, 25)];
    lbl_title.backgroundColor = [UIColor clearColor];
    lbl_title.textColor = [UIColor whiteColor];
    lbl_title.font = [UIFont fontWithName:KFontUsed size:15.0];
    lbl_title.text = @"My Accounts";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    
    
    
    tableForMainSetting = [[UITableView alloc] initWithFrame:CGRectMake(0,60,self.view.frame.size.width,IS_IPHONE_5 ? 420 : 367) style:UITableViewStyleGrouped];
    tableForMainSetting.dataSource = self;
    tableForMainSetting.delegate = self;
    tableForMainSetting.backgroundColor = [UIColor clearColor];
    
    if ([tableForMainSetting respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableForMainSetting setSeparatorInset:UIEdgeInsetsZero];
        
    }
    [tableForMainSetting setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tableForMainSetting];
    
    
    if ([tableForMainSetting respondsToSelector:@selector(setBackgroundView:)]) {
        [tableForMainSetting setBackgroundView:nil];
    }
}


-(void)viewWillAppear:(BOOL)animated{
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    [self.navigationController.slideMenuController UnhideHomeButton];
}


#pragma mark - tableViewDelegate
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.backgroundColor=[UIColor clearColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    else
    {
        UIView *subview;
        while ((subview= [[[cell contentView]subviews]lastObject])!=nil)
            [subview removeFromSuperview];
    }
    
    
    
    
    UILabel *label1=[[UILabel alloc]init];
    [label1 setFrame:CGRectMake(20, 15, 300, 20)];
    [label1 setTextAlignment:NSTextAlignmentLeft];
    [label1 setTextColor:[UIColor blackColor]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [label1 setFont:[UIFont fontWithName:KFontUsed size:12.0]];
    [cell.contentView addSubview:label1];
    
    
    //Imageview for accessory right green arrow
    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 17, 38, 20)];
    [imageView2 setContentMode:UIViewContentModeScaleToFill];
    imageView2.layer.masksToBounds=YES;
    [imageView2 setClipsToBounds:YES];
    [cell.contentView addSubview:imageView2];
    
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(10,  50, Width-20,1);
    V1.backgroundColor=[UIColor grayColor];
    [cell.contentView addSubview:V1];
    
    
    
    
    if (indexPath.row==0) {
        [label1 setText:@"MY PROFILE"];
        [imageView2 setImage:[UIImage imageNamed:@"tableArrow@2x.png"]];
    }
    else if (indexPath.row==1){
        [label1 setText:@"CHANGE PASSWORD"];
        [imageView2 setImage:[UIImage imageNamed:@"tableArrow@2x.png"]];
    }
    else if (indexPath.row==2){
        [label1 setText:@"PORTFOLIO"];
        [imageView2 setImage:[UIImage imageNamed:@"tableArrow@2x.png"]];
    }
    else if (indexPath.row==3){
        [label1 setText:@"SERVICE PROVIDED"];
        [imageView2 setImage:[UIImage imageNamed:@"tableArrow@2x.png"]];
    }
    else{
        [label1 setText:@"APP VERSION 1.0"];
    }
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0f;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        MyProfileVC *vc=[MyProfileVC new];
        [self.navigationController pushViewController:vc];
        
    }
    else if (indexPath.row==1){
        ChangePasswordVC *vc = [[ChangePasswordVC alloc]init];
        [self.navigationController pushViewController:vc];
    }
    else if (indexPath.row==2){
        PortfolioVC *vc = [[PortfolioVC alloc]init];
        [self.navigationController pushViewController:vc];
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
