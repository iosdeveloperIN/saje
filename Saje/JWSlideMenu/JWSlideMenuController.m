//  JWSlideMenuController.m
//  JWSlideMenu
//  Created by Jeremie Weldin on 11/14/11.
//  Copyright (c) 2011 Jeremie Weldin. All rights reserved.

#import "JWSlideMenuController.h"
#import "JWNavigationController.h"
#import "JWSlideMenuViewController.h"
#import "AppDelegate.h"

//#import "HomeViewController.h"

@implementation JWSlideMenuController
@synthesize menuTableView;
@synthesize menuView;
//@synthesize contentToolbar;
@synthesize contentView;
@synthesize menuLabelColor;
@synthesize searchController;
@synthesize homeButton;

- (id)init
{
    self = [super init];
    if (self)
    {
        mAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        self.navigationController.navigationBar.hidden=YES;
             
        CGRect masterRect = self.view.bounds;
        float menuWidth = 267.0; //masterRect.size.width - 53
        
        
        CGRect contentFrame = CGRectMake(0.0, 0.0, masterRect.size.width, masterRect.size.height); // y start - 40
        
        
        
        
        homeButton = [[UIButton alloc] init];
      //  homeButton.frame = CGRectMake(14, 15, 36, 30);
            homeButton.frame = CGRectMake(14, 18, 36, 30);
        [homeButton setTag:-3];
        homeButton.backgroundColor = [UIColor clearColor];
        homeButton.showsTouchWhenHighlighted = YES;
//        homeButton.layer.borderWidth = 1;
//        homeButton.layer.borderColor = [[UIColor greenColor] CGColor];
      //  [homeButton setBackgroundImage:[UIImage imageNamed:@"JW_Main@2x.png"] forState:UIControlStateNormal];
        [homeButton addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        
        self.menuLabelColor = [UIColor blackColor];
        CGRect frameForTableview = CGRectMake(0.0, 0.0, menuWidth, masterRect.size.height);
        
        self.menuTableView = [[UITableView alloc] initWithFrame:frameForTableview];
//        
//        self.menuTableView = [[[UITableView alloc] initWithFrame:menuFrame] autorelease];
        self.menuTableView.dataSource = self;
        self.menuTableView.delegate = self;
        // [self.menuTableView setBackgroundColor:[UIColor colorWithRed:(161.0/255.0) green:(203.0/255.0) blue:(03.0/255.0) alpha:1.0]];
       // [self.menuTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menu@2x.png"]]];
        [self.menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//        self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//        [self.menuTableView setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SliderDivider@2x.png"]]];
        
        UIImageView *DividerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(menuWidth-4,-250,4,masterRect.size.height+350)];
        [DividerImageView setImage:[UIImage imageNamed:@"Hz_Line@2x.png"]];
        [self.menuTableView addSubview:DividerImageView];
     
        
        self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0,menuWidth, masterRect.size.height)];
        self.menuView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Deafult@2x.png"]];
        [self.menuView addSubview:self.menuTableView];
        
        self.contentView = [[UIView alloc] initWithFrame:contentFrame];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Deafult@2x.png"]];
        
        [self.view addSubview:self.menuView];
        [self.view insertSubview:self.contentView aboveSubview:self.menuView];
        [self.view addSubview:homeButton];
        
//        UISwipeGestureRecognizer *swipeGesture=nil;
//        swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleAllSwipes:)];
//        swipeGesture.cancelsTouchesInView = NO;
//        swipeGesture.delaysTouchesEnded = NO;
//        swipeGesture.direction = UISwipeGestureRecognizerDirectionRight ; // ++page
//        swipeGesture.delegate = self;
//        [contentView addGestureRecognizer:swipeGesture];
//        [swipeGesture release];
//        
//        swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleAllSwipes:)];
//        swipeGesture.cancelsTouchesInView = NO;
//        swipeGesture.delaysTouchesEnded = NO;
//        swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft ;
//        swipeGesture.delegate = self;
//        [menuView addGestureRecognizer:swipeGesture];
//        [swipeGesture release];
        
//        UITapGestureRecognizer *Tapgesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handletap)];
//        Tapgesture.numberOfTapsRequired=1; 
//        Tapgesture.numberOfTouchesRequired=1;
//        [contentView addGestureRecognizer:Tapgesture];
//        [Tapgesture release];
        
    }
    return self;
}


//-(void)handletap
//{
//    if(self.contentView.frame.origin.x == 0) //Menu is hidden
//    {
////        NSLog(@"menu view hidden");
//    }
//    else
//    {
//         [self toggleMenu];
//    }
//}


//- (void)handleAllSwipes:(UISwipeGestureRecognizer *)recognizer
//{
//    [self toggleMenu];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}

-(void)toggleMenu
{
    UITextField *searchTextField = (UITextField *)[self.view viewWithTag:-2];
    [searchTextField resignFirstResponder];
    
    [UIView beginAnimations:@"Menu Slide" context:nil];
    [UIView setAnimationDuration:0.2];
    
    if(self.contentView.frame.origin.x == 0) //Menu is hidden
    {
   

        CGRect newFrame = CGRectOffset(self.contentView.frame, self.menuView.frame.size.width, 0.0);
        homeButton.frame = CGRectMake(267+14, 18,36,30);
        self.contentView.frame = newFrame;
        
        for (int i = 0; i < self.childViewControllers.count; i++) {
            JWSlideMenuViewController *vc = [[JWSlideMenuViewController alloc]init];
            vc = [self.childViewControllers objectAtIndex:i];
            [vc.view setUserInteractionEnabled:NO];
            
        }
          
    }
    else //Menu is shown
    {
//        [menuTableView reloadData];
        CGRect newFrame = CGRectOffset(self.contentView.frame, -(self.menuView.frame.size.width), 0.0);
        homeButton.frame = CGRectMake(14, 18, 36, 30);
        self.contentView.frame = newFrame;
        
        for (int i = 0; i < self.childViewControllers.count; i++) {
            JWSlideMenuViewController *vc = [self.childViewControllers objectAtIndex:i];
            [vc.view setUserInteractionEnabled:YES];
            
        }
    }
    
    [UIView commitAnimations];
}


-(JWNavigationController *)addViewController:(JWSlideMenuViewController *)controller withTitle:(NSString *)title andImage:(UIImage *)image
{
    JWNavigationController *navController = [[JWNavigationController alloc] initWithRootViewController:controller] ;
    navController.slideMenuController = self;
    navController.title = title;
    navController.tabBarItem.image = image;

    [self addChildViewController:navController];
    
    if([self.childViewControllers count] == 1)
    {
        [self.contentView addSubview:navController.view];
    }
    
    return navController;
}

#pragma mark - UITableViewDataSource/Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *searchBGImageView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width-5,50)];
    [searchBGImageView setUserInteractionEnabled:YES];
    [searchBGImageView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Menu@2x"]]];
    
    UIImageView *imageview_Item = [[UIImageView alloc]initWithFrame:CGRectMake(110, 15, 60, 60)];
    imageview_Item.layer.cornerRadius = 60/2.0f;
    imageview_Item.layer.borderWidth = 2.5;
    UIColor* color = [UIColor whiteColor];
    imageview_Item.layer.borderColor = [color CGColor];
    imageview_Item.layer.borderColor = [UIColor colorWithRed:74.0/255.0 green:144.0/255.0 blue:240.0/255.0 alpha:1.0].CGColor;

    [imageview_Item setImage:[UIImage imageNamed:@"Top@2x.png"]];
    [imageview_Item setContentMode:UIViewContentModeScaleAspectFill];
    imageview_Item.clipsToBounds = YES;
  //  [searchBGImageView addSubview:imageview_Item];
    
    
    UILabel *lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(110, 75, 70, 20)];
    NSString *firstName=@"User X";
    firstName = [[firstName componentsSeparatedByString:@" "]objectAtIndex:0];
    lbl_Name.text  = firstName;
    [lbl_Name setTextAlignment:NSTextAlignmentCenter];
    [lbl_Name setLineBreakMode:NSLineBreakByWordWrapping];
    lbl_Name.backgroundColor = [UIColor clearColor];
    lbl_Name.textColor = [UIColor whiteColor];
    lbl_Name.font = [UIFont fontWithName:@"Arial" size:12.0f];
    [searchBGImageView addSubview:lbl_Name];
    
    UIImageView *imageView_UnderLine = [[UIImageView alloc] init];
    imageView_UnderLine.frame = CGRectMake(1, 110, 70, 0.3);
    [imageView_UnderLine setImage:[UIImage imageNamed:@"img_Trans@2x.png"]];
    [imageView_UnderLine setBackgroundColor:[UIColor clearColor]];
    [searchBGImageView addSubview:imageView_UnderLine];
    
    [searchBGImageView addSubview:imageview_Item];

    
    return searchBGImageView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
        
        UIView *selectedBG = [[UIView alloc] init];
//        [selectedBG setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"JW_selected@2x.png"]]];
       //  [selectedBG setBackgroundColor:[UIColor colorWithRed:(101.0/255.0) green:(127.0/255.0) blue:(00.0/255.0) alpha:1.0]];
        [cell setSelectedBackgroundView:selectedBG];
    
    }
    else
	{
		for (UIView *view in cell.contentView.subviews)
			[view removeFromSuperview];
   }
    if (indexPath.row==0) {
        UIImageView *imageview_Item = [[UIImageView alloc]initWithFrame:CGRectMake(100, 40, 80, 80)];
        imageview_Item.layer.cornerRadius = 80/2.0f;
       // imageview_Item.layer.borderWidth = 2.5;
      //  UIColor* color = [UIColor whiteColor];
      //  imageview_Item.layer.borderColor = [color CGColor];
       // imageview_Item.layer.borderColor = [UIColor colorWithRed:74.0/255.0 green:144.0/255.0 blue:240.0/255.0 alpha:1.0].CGColor;
        
        [imageview_Item setImage:[UIImage imageNamed:@"avatar@2x.png"]];
       // [imageview_Item setContentMode:UIViewContentModeScaleAspectFill];
        //imageview_Item.clipsToBounds = YES;
        [cell.contentView addSubview:imageview_Item];
        
        
        UILabel *lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(110, 130, 70, 20)];
        NSString *firstName=@"User X";
        firstName = [[firstName componentsSeparatedByString:@" "]objectAtIndex:0];
        lbl_Name.text  = firstName;
        [lbl_Name setTextAlignment:NSTextAlignmentCenter];
        [lbl_Name setLineBreakMode:NSLineBreakByWordWrapping];
        lbl_Name.backgroundColor = [UIColor clearColor];
        lbl_Name.textColor = [UIColor whiteColor];
        lbl_Name.font = [UIFont fontWithName:@"Arial" size:25.0f];
        [cell.contentView addSubview:lbl_Name];
    }

    UIViewController *controller = (UIViewController *)[self.childViewControllers objectAtIndex:indexPath.row] ;

    UILabel *categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 250, 30)];
    [categoryLabel setText:controller.title];
    [categoryLabel setTextColor:[UIColor whiteColor]];
    [categoryLabel setBackgroundColor:[UIColor clearColor]];
    [categoryLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:14.0f]];
    [cell.contentView addSubview:categoryLabel];
 

    UIImageView *cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 14, 28, 28)];
    [cellImageView setImage:controller.tabBarItem.image];
    [cellImageView setBackgroundColor:[UIColor clearColor]];
    [cellImageView setUserInteractionEnabled:YES];
    [cell.contentView addSubview:cellImageView];
//    [cellImageView release];

    
    
    UIImageView *celldividerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    [celldividerImageView setImage:[UIImage imageNamed:@"JWMenuDividerLine@2x.png"]];
    [celldividerImageView setBackgroundColor:[UIColor clearColor]];
    [celldividerImageView setUserInteractionEnabled:YES];
    [cell.contentView addSubview:celldividerImageView];

    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [UIView new];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    if (screenRect.size.height == 568)
    {
        
        if (indexPath.row==0) {
            return 260;
        }else if (indexPath.row==2){
            return 100;
        }else if (indexPath.row==3){
            return 400;
        }
        
        return 50.0f;
        
        // this is an iPhone 5+
    }else if (screenRect.size.height == 647)
    {
        
        if (indexPath.row==0) {
            return 310;
        }else if (indexPath.row==2){
            return 100;
        }else if (indexPath.row==3){
            return 400;
        }
        
        return 50.0f;
        
        // this is an iPhone 6
    }else if (screenRect.size.height == 716)
    {
        
        if (indexPath.row==0) {
            return 370;
        }else if (indexPath.row==2){
            return 100;
        }else if (indexPath.row==3){
            return 400;
        }
        
        return 50.0f;
        
        // this is an iPhone 6+
    }

    
    return 50.0f;
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.childViewControllers count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    for (UIView *subviews in contentView.subviews)
    {

            [subviews removeFromSuperview];

    }
    

    
    SearchBool = NO;
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:indexPath.row];
    controller.view.frame = self.contentView.bounds;
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
}

#pragma mark -

-(void)HideHomeButton
{
    homeButton.hidden = YES;
   // btn_TransHome.hidden = YES;
}

-(void)UnhideHomeButton
{
    homeButton.hidden = NO;
   // btn_TransHome.hidden = NO;
}


-(void)ChangetoInfo{
    for (UIView *subviews in contentView.subviews)
    {
         [subviews removeFromSuperview];
    }
    
    SearchBool = NO;
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:1];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}

-(void)ChangeToHome{
    for (UIView *subviews in contentView.subviews)
    {
        //        if([contentView.subviews count] == 1)
        //        {
        [subviews removeFromSuperview];
        // }
    }
    
    SearchBool = NO;
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:0];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
}

-(void)ChangeToSettings{
    for (UIView *subviews in contentView.subviews)
    {
        //        if([contentView.subviews count] == 1)
        //        {
        [subviews removeFromSuperview];
        // }
    }
    
    SearchBool = NO;
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:5];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}



-(void)ChangeToUpcomingCalls{
    for (UIView *subviews in contentView.subviews)
    {
        //        if([contentView.subviews count] == 1)
        //        {
        [subviews removeFromSuperview];
        // }
    }
    
    SearchBool = NO;
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:2];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}

-(void)ChangeToDirections{
    for (UIView *subviews in contentView.subviews)
    {
       [subviews removeFromSuperview];

    }
     SearchBool = NO;
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:3];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}
-(void)ChangeToCalendar{
    for (UIView *subviews in contentView.subviews)
    {
        [subviews removeFromSuperview];
        
    }
    SearchBool = NO;
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:4];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    controller.view.frame = self.contentView.bounds;
    
    [contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}






#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setMenuView:nil];
    [self setContentView:nil];
    [self setMenuTableView:nil];
    [self setMenuLabelColor:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}





-(void)Test
{
    [self toggleMenu];
}

#pragma mark SEARCHBAR DELEGATE METHODS STARTS HERE
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
	{
        SearchBool = YES;
        [searchBar resignFirstResponder];
	}
    return YES;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    if (!searchBar.text.length==0)
    {
        [searchBar resignFirstResponder];
    }
    if (searchBar.text.length==0)
    {
        [searchBar resignFirstResponder];
    }

    if(SearchBool)
    {
//        SearchViewController *searchVC = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:[NSBundle mainBundle]];
//    
//        NSString *tempString = [NSString stringWithString:searchBar.text];
//        mAppDelegate.searchString = tempString;
//        searchBar.text = @"";
//        searchBar.showsCancelButton = NO;
//    
//        [self presentViewController:searchVC animated:YES completion:nil];
        
    
//      UIViewController* controller = (UIViewController*)[self.childViewControllers        objectAtIndex:0];
//      controller.view.frame = self.contentView.bounds;
//    
//      [contentView addSubview:controller.view];
    
      //  [self toggleMenu];
    }
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText isEqualToString:@"\n"])
	{
		[searchBar resignFirstResponder];
	}
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    if (SearchBool)
    {
        [searchBar resignFirstResponder];
        SearchBool = NO;
    }
    else
    searchBar.showsCancelButton = YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    searchBar.text=nil;
    [searchBar resignFirstResponder];
}





#pragma SEARCHBAR DELEGATE METHODS ENDS HERE

#pragma mark Text Field Delegate Methods 
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField.text length] != 0)
    {
//        SearchViewController *searchVC = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:[NSBundle mainBundle]];
//        
//        NSString *tempString = [NSString stringWithString:textField.text];
//        mAppDelegate.searchString = tempString;
//        textField.text = @"";
//        [self presentViewController:searchVC animated:YES completion:nil];
    }
	[textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return TRUE;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
