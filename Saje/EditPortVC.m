//
//  EditPortVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "EditPortVC.h"
#import "Define.h"

@interface EditPortVC ()<UITextViewDelegate>
{
    UILabel *lbl_Save;
    UITextView *textview_Edit;
}
@end

@implementation EditPortVC

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
    lbl_title.text = @"Edit Bio";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    lbl_Save = [[UILabel alloc]initWithFrame:CGRectMake(Width-80, 25 , 80, 25)];
    lbl_Save.backgroundColor = [UIColor clearColor];
    lbl_Save.textColor = [UIColor whiteColor];
    lbl_Save.font = [UIFont fontWithName:KFontUsed size:13.0];
    lbl_Save.text = @"SAVE";
    lbl_Save.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_Save];
    
    UIButton *btn_Save =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_Save.frame=CGRectMake(Width-100,0,100,60);
    [btn_Save setBackgroundColor:[UIColor clearColor]];
    [[btn_Save layer] setCornerRadius:0.0f];
    [btn_Save addTarget:self action:@selector(btn_SaveClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Save];
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    
    textview_Edit = [[UITextView alloc]init];
    textview_Edit.frame = CGRectMake(15, 90, 320-30,self.view.frame.size.height-100-90);
    textview_Edit.font = [UIFont fontWithName:KFontUsed size:14];
    textview_Edit.textColor = UIColorForBG;
    textview_Edit.backgroundColor = [UIColor clearColor];
    [textview_Edit setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textview_Edit setEditable:YES];
    textview_Edit.text = @"Loading...";
    [self.view addSubview:textview_Edit];
    
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(20,  self.view.frame.size.height-100, Width-40, 1);
    V1.backgroundColor=UIColorForBG;
    [self.view addSubview:V1];
    
}


-(void)btn_SaveClicked{
    
    [self.navigationController popViewController];
}

-(void)btn_BackClicked{
    [self.navigationController popViewController];
}

#pragma mark Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



-(void) textViewDidEndEditing:(UITextView *)textView{
   
    
    [UIView animateWithDuration:0.2 animations:^(void){
        [textView resignFirstResponder];
        
    } completion:^(BOOL finished){
        
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
