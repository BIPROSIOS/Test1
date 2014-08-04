//
//  FifthViewController.m
//  HelloWorld
//
//  Created by Default on 7/18/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "FifthViewController.h"
#import "CustomCell.h"

@interface FifthViewController ()
{
    NSArray * arrayOfImages;
    NSArray * arrayOfDescriptions;
    
}

@end

@implementation FifthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self CollectionViewTest]setDataSource:self];
    [[self CollectionViewTest]setDelegate:self];
    arrayOfImages = [[NSArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg", nil];
    arrayOfDescriptions = [[NSArray alloc]initWithObjects:@"One",@"TWo",@"Three", @"Four", @"Five", nil];
    
    
    
    
}
//datasourse and deligate method
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrayOfDescriptions count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  * cellIdentifier = @"Cell";
    CustomCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [[cell ImageViewMy]setImage:[UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]]];
    [[cell LabelDescription]setText:[arrayOfDescriptions objectAtIndex:indexPath.item]];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - IBActionSheet Examples
- (IBAction)dismissKeyboard:(id)sender {
    switch ([sender tag]) {
        case 1:
            [_TextTextField resignFirstResponder];
            break;
            
        default:
            break;
    }
}

- (IBAction)closeKeyBoard:(id)sender {
    if([_TextTextField isFirstResponder] )
    {
        [_TextTextField resignFirstResponder];
    }
}

- (IBAction)popUpBtn:(id)sender {
//
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Standard UIActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Emphasis" otherButtonTitles:@"Other", @"Buttons", nil];
//    [actionSheet showInView:self.view];
    UIActionSheet * actionSheet2 = [[UIActionSheet alloc] initWithTitle:@"My title" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Option1",@"Option2", @"Option3", nil];
    [actionSheet2 showInView:self.view];
   
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            //code for first
            
        }
            break;
            
        default:
            break;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



//
//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    [self animateTextField:textField up:YES];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    [self animateTextField:textField up:NO];
//}
//
//-(void)animateTextField:(UITextField*)textField up:(BOOL)up
//{
//    const int movementDistance = -130; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? movementDistance : -movementDistance);
//    
//    [UIView beginAnimations: @"animateTextField" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}

//- (IBAction)standardUIActionSheetPressed:(id)sender {
//    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Standard UIActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Emphasis" otherButtonTitles:@"Other", @"Buttons", nil];
//    [actionSheet showInView:self.view];
//}
//
//- (IBAction)standardIBActionSheetPressed:(id)sender {
//    
//    self.standardIBAS = [[IBActionSheet alloc] initWithTitle:@"Standard IBActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Emphasis" otherButtonTitlesArray:@[@"Other", @"Buttons"]];
//    [self.standardIBAS showInView:self.view];
//}
@end