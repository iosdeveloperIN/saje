//
//  ChangePhotoVC.m
//  Saje
//
//  Created by Nagendra Tripathi on 16/01/15.
//  Copyright (c) 2015 Rohit Tripathi. All rights reserved.
//

#import "ChangePhotoVC.h"
#import "Define.h"
#import "SVProgressHUD.h"

@interface ChangePhotoVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSData *imgData;
    UIImageView *imageview_ProfilePic;


}
@end

@implementation ChangePhotoVC

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
    lbl_title.text = @"Change Photo";
    lbl_title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl_title];
    
    UIButton *btn_Back=[[UIButton alloc]initWithFrame:CGRectMake(0,0,80,80)];
    [btn_Back addTarget:self action:@selector(btn_BackClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Back setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Back];
    
    imageview_ProfilePic = [[UIImageView alloc] init];
    imageview_ProfilePic.frame=CGRectMake(0, 60,Width, 300);
    [imageview_ProfilePic setUserInteractionEnabled:YES];
    [imageview_ProfilePic setBackgroundColor:[UIColor clearColor]];
    [imageview_ProfilePic setImage:[UIImage imageNamed:@"CoverPhoto@2x.png"]];
    [self.view addSubview:imageview_ProfilePic];

    
    UIImageView*   imageview_Camera = [[UIImageView alloc] init];
    imageview_Camera.frame=CGRectMake(0, 380,Width, 45);
    [imageview_Camera setUserInteractionEnabled:YES];
    [imageview_Camera setBackgroundColor:[UIColor clearColor]];
    [imageview_Camera setImage:[UIImage imageNamed:@"Cam@2x.png"]];
    [self.view addSubview:imageview_Camera];
    
    UIButton *btn_Camera=[[UIButton alloc]initWithFrame:CGRectMake(0, 380,Width, 45)];
    [btn_Camera addTarget:self action:@selector(btn_CameraClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Camera setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Camera];
    
    
    UIImageView*   imageview_Photo = [[UIImageView alloc] init];
    imageview_Photo.frame=CGRectMake(0, 380+55,Width, 45);
    [imageview_Photo setUserInteractionEnabled:YES];
    [imageview_Photo setBackgroundColor:[UIColor clearColor]];
    [imageview_Photo setImage:[UIImage imageNamed:@"Photos@2x.png"]];
    [self.view addSubview:imageview_Photo];
    
    UIButton *btn_Photo=[[UIButton alloc]initWithFrame:CGRectMake(0, 380+55,Width, 45)];
    [btn_Photo addTarget:self action:@selector(btn_PhotoClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Photo setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Photo];
    
    UIImageView*   imageview_RemovePhoto = [[UIImageView alloc] init];
    imageview_RemovePhoto.frame=CGRectMake(0, 380+55+55,Width, 45);
    [imageview_RemovePhoto setUserInteractionEnabled:YES];
    [imageview_RemovePhoto setBackgroundColor:[UIColor clearColor]];
    [imageview_RemovePhoto setImage:[UIImage imageNamed:@"Photos@2x.png"]];
    [self.view addSubview:imageview_RemovePhoto];
    
    UIButton *btn_Remove=[[UIButton alloc]initWithFrame:CGRectMake(0, 380+55+55,Width, 45)];
    [btn_Remove addTarget:self action:@selector(btn_RemoveClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn_Remove setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:btn_Remove];
    
    
}


-(void)btn_CameraClicked{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController*imgPicker = [[UIImagePickerController alloc] init];
        UIColor* color = [UIColor colorWithRed:46.0/255 green:127.0/255 blue:244.0/255 alpha:1];
        [imgPicker.navigationBar setTintColor:color];
        imgPicker.delegate = self;
        imgPicker.allowsEditing = YES;
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imgPicker.wantsFullScreenLayout = YES;
        [self presentViewController:imgPicker animated:NO completion:Nil];
        
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Shall We" message:@"Device does not support camera" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

    
}
-(void)btn_PhotoClicked{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController*imgPicker = [[UIImagePickerController alloc] init];
        UIColor* color = [UIColor colorWithRed:46.0/255 green:127.0/255 blue:244.0/255 alpha:1];
        [imgPicker.navigationBar setTintColor:color];
        imgPicker.delegate = self;
        imgPicker.allowsEditing = YES;
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       // imgPicker.wantsFullScreenLayout = YES;
        [self presentViewController:imgPicker animated:NO completion:Nil];
    }
    
}
-(void)btn_RemoveClicked{
    [self.navigationController popViewController];
}
-(void)btn_BackClicked{
    [self.navigationController popViewController];
}



#pragma mark - IMAGEPICKER DELEGATE METHODS
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *imageOriginal =  [info objectForKey:UIImagePickerControllerEditedImage];
    
    ;
    imageview_ProfilePic.image = imageOriginal;
    
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
