//
//  AddPortVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "AddPortVC.h"
#import "Define.h"

@interface AddPortVC ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    UILabel *lbl_Save;
    UITextField  *textfield_FirstName;
    UIImageView*   imageview_CP;
     NSData *imgData;
}
@end

@implementation AddPortVC

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
    lbl_title.text = @"Add Image";
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
    
    #define Height 40
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    
    textfield_FirstName = [[UITextField alloc]init];
    [textfield_FirstName setFrame:CGRectMake(0, 70, Width, Height)];
    [textfield_FirstName setDelegate:self];
    textfield_FirstName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfield_FirstName.clipsToBounds = YES;
    textfield_FirstName.textAlignment = NSTextAlignmentLeft;
    textfield_FirstName.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_FirstName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textfield_FirstName setFont:[UIFont systemFontOfSize:15.0f]];
    [textfield_FirstName setTextColor:[UIColor blackColor]];
    [textfield_FirstName setBackgroundColor:[UIColor clearColor]];
    [textfield_FirstName setPlaceholder:@"Image Title" ];
    [textfield_FirstName setValue:UIColorForBG
                       forKeyPath:@"_placeholderLabel.textColor"];
    [textfield_FirstName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [textfield_FirstName setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [textfield_FirstName setReturnKeyType:UIReturnKeyDone];
    [textfield_FirstName setUserInteractionEnabled:YES];
    textfield_FirstName.leftView = paddingView1;
    textfield_FirstName.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textfield_FirstName];
    
    UIView *V1= [UIView new];
    V1.frame=CGRectMake(20,  textfield_FirstName.frame.origin.y+Height, Width-40, 1);
    V1.backgroundColor=UIColorForBG;
    [self.view addSubview:V1];
    
    
    
    imageview_CP = [[UIImageView alloc] init];
    imageview_CP.frame=CGRectMake(0, 130,Width, self.view.frame.size.height-100-130);
    [imageview_CP setUserInteractionEnabled:YES];
    [imageview_CP setBackgroundColor:[UIColor clearColor]];
    [imageview_CP setImage:[UIImage imageNamed:@"CoverPhoto1@2x.png"]];
    [self.view addSubview:imageview_CP];
    
    
    UIButton *btn_CI =[UIButton buttonWithType:UIButtonTypeCustom];
    btn_CI.frame=CGRectMake(20, self.view.frame.size.height-90,Width-40,40);
    [btn_CI setTitle:@"CHOOSE IMAGE" forState:UIControlStateNormal];
    [btn_CI.titleLabel setFont:[UIFont fontWithName:KFontUsed size:14.0]];
    [btn_CI setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal];
    [btn_CI setTitleColor:[UIColor whiteColor ] forState:UIControlStateHighlighted];
    [btn_CI setBackgroundColor:UIColorForBG];
    [[btn_CI layer] setCornerRadius:1.0f];
    btn_CI.layer.borderColor =[[UIColor blueColor] CGColor];
    btn_CI.layer.cornerRadius=8.0;
    [btn_CI addTarget:self action:@selector(btn_CIClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_CI];
    
    
    
    
    
    
}

-(void)btn_CIClicked{
    
    [textfield_FirstName resignFirstResponder];
    
    
    UIActionSheet *actionSheet_popupQuery = [[UIActionSheet alloc] initWithTitle:@"Select a picture from" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Photo Library", @"Camera", nil];
    actionSheet_popupQuery.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet_popupQuery showInView:self.view];
    
}

-(void)btn_SaveClicked{
    
    [self.navigationController popViewController];
}



-(void)btn_BackClicked{
    [self.navigationController popViewController];
}



#pragma mark - ACTION SHEET DELEGATE
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0)
    {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController*imgPicker = [[UIImagePickerController alloc] init];
            UIColor* color = [UIColor colorWithRed:46.0/255 green:127.0/255 blue:244.0/255 alpha:1];
            [imgPicker.navigationBar setTintColor:color];
            imgPicker.delegate = self;
            imgPicker.allowsEditing = YES;
            imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imgPicker animated:NO completion:Nil];
        }
    }
    else if(buttonIndex == 1)
    {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController*imgPicker = [[UIImagePickerController alloc] init];
            UIColor* color = [UIColor colorWithRed:46.0/255 green:127.0/255 blue:244.0/255 alpha:1];
            [imgPicker.navigationBar setTintColor:color];
            imgPicker.delegate = self;
            imgPicker.allowsEditing = YES;
            imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imgPicker animated:NO completion:Nil];
            
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Shall We" message:@"Device does not support camera" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}


#pragma mark - IMAGEPICKER DELEGATE METHODS
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *imageOriginal =  [info objectForKey:UIImagePickerControllerEditedImage];
    
    ;
    imageview_CP.image =imageOriginal;
    
    imgData = UIImageJPEGRepresentation(imageOriginal,0.5);
    
    if(imgData != nil){
        //[images_array addObject:imgData];
    }
    
    if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        
    }
    else
    {
        
    }
    [picker dismissViewControllerAnimated:YES completion:Nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    
    [picker dismissViewControllerAnimated:YES completion:Nil];
}


#pragma mark Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}




-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
