//
//  LogoutVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 12/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "LogoutVC.h"
#import "Define.h"
#import "AppDelegate.h"


@interface LogoutVC ()
{
     AppDelegate *delegate;
}
@end

@implementation LogoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    self.view.backgroundColor = UIColorForBG;
}
-(void)viewWillAppear:(BOOL)animated{
    
    delegate.flag=YES;
    
    [self.navigationController dismissViewControllerAnimated:NO completion:^(void){
        //delegate.flag=YES;
    }];
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
