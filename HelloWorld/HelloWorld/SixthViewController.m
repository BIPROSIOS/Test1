//
//  SixthViewController.m
//  HelloWorld
//
//  Created by Default on 7/24/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "SixthViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface SixthViewController ()

@end

@implementation SixthViewController
{
    CLLocationManager * manager;
    CLGeocoder * geoCoder;
    CLPlacemark * placemark;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_myScrollView setScrollEnabled:YES];
    [_myScrollView setContentSize:CGSizeMake(320, 615)];
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:@"My saved Data" forKey:@"infoString"];
    
    //for location
    manager = [[CLLocationManager alloc]init];
    geoCoder = [[CLGeocoder alloc]init];
    
    //get get location
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(20.326116, 85.818656) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        NSLog(@"reverse geocoding results:");
        for(GMSAddress* addressObj in [response results])
        {
            NSLog(@"coordinate.latitude=%f", addressObj.coordinate.latitude);
            NSLog(@"coordinate.longitude=%f", addressObj.coordinate.longitude);
            NSLog(@"thoroughfare=%@", addressObj.thoroughfare);
            NSLog(@"locality=%@", addressObj.locality);
            NSLog(@"subLocality=%@", addressObj.subLocality);
            NSLog(@"administrativeArea=%@", addressObj.administrativeArea);
            NSLog(@"postalCode=%@", addressObj.postalCode);
            NSLog(@"country=%@", addressObj.country);
            NSLog(@"lines=%@", addressObj.lines);
            //_loactionLabel.text = addressObj.lines;
            _loactionLabel.text = [[addressObj valueForKey:@"lines"] componentsJoinedByString:@" "];
            break;
        }
    }];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



//- (void)registerForKeyboardNotifications {
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWasShown:)
//                                                 name:UIKeyboardDidShowNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillBeHidden:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//    
//}
//
//- (void)deregisterFromKeyboardNotifications {
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardDidHideNotification
//                                                  object:nil];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillHideNotification
//                                                  object:nil];
//    
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    
//    [self registerForKeyboardNotifications];
//    
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    
//    [self deregisterFromKeyboardNotifications];
//    
//    [super viewWillDisappear:animated];
//    
//}
//
//
//- (void)keyboardWasShown:(NSNotification *)notification {
//    
//    NSDictionary* info = [notification userInfo];
//    
//    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    CGPoint buttonOrigin = self.signInButton.frame.origin;
//    
//    CGFloat buttonHeight = self.signInButton.frame.size.height;
//    
//    CGRect visibleRect = self.view.frame;
//    
//    visibleRect.size.height -= keyboardSize.height;
//    
//    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
//        
//        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
//        
//        [_myScrollView setContentOffset:scrollPoint animated:YES];
//        
//    }
//    
//}
//
//- (void)keyboardWillBeHidden:(NSNotification *)notification {
//    
//    [_myScrollView setContentOffset:CGPointZero animated:YES];
//    
//}







-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [self animateTextField:textField up:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
    
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
   // NSDictionary* info = [notification userInfo];
    
    
        CGPoint textBoxOrigin = textField.frame.origin;
        CGFloat textBoxHeight = textField.frame.size.height;
        CGRect visibleRect = self.view.frame;
        //CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        CGFloat kbHeight = 320;
        CGFloat kbWidth = 230;
        CGSize keyboardSize = CGSizeMake(kbWidth, kbHeight);
        int crY = _myScrollView.frame.origin.y;
        if(crY > 320)
        {
            crY = crY;
        }else{
            crY = crY + textBoxHeight + 50;
        }
       // CGPoint currentlocation = CGPointMake(0.0, textField.frame.origin.y - kbHeight);
        CGPoint currentlocation = CGPointMake(_myScrollView.frame.origin.x ,  crY);
    
        visibleRect.size.height -= keyboardSize.height;
        CGFloat nextPosition = textBoxOrigin.y - visibleRect.size.height + textBoxHeight;
    if (up != NO) {
        if (!CGRectContainsPoint(visibleRect, textBoxOrigin))
        {
            
            CGPoint scrollPoint = CGPointMake(0.0, nextPosition);
            
            [_myScrollView setContentOffset:scrollPoint animated:YES];
            
        }
    } else {
        //[_myScrollView setContentOffset:CGPointZero animated:YES];
        [_myScrollView setContentOffset:currentlocation animated:YES];
    }


    
    
//    
//    const int movementDistance = -130; // tweak as needed
//    const float movementDuration = 0.5f; // tweak as needed
//    
//    int movement = (up ? movementDistance : -movementDistance);
//    
//    [UIView beginAnimations: @"animateTextField" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
}



- (IBAction)dismissKeyboard:(id)sender {
    int a = [sender tag];
    switch ([sender tag]) {
        case 501:
            [_TextBox1 resignFirstResponder];
            break;
        case 502:
            [_TextBox2 resignFirstResponder];
            break;
        case 503:
            [_TextBox3 resignFirstResponder];
            break;
        case 504:
            [_TextBox4 resignFirstResponder];
            break;
      
    }
    
}




@end
