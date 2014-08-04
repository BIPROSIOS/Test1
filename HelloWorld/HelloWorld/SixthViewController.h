//
//  SixthViewController.h
//  HelloWorld
//
//  Created by Default on 7/24/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SixthViewController : UIViewController<UITextFieldDelegate ,  CLLocationManagerDelegate>
{
    IBOutlet UIScrollView * scroller;
}
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UITextField *TextBox1;

@property (weak, nonatomic) IBOutlet UITextField *TextBox2;
@property (weak, nonatomic) IBOutlet UITextField *TextBox3;
@property (weak, nonatomic) IBOutlet UITextField *TextBox4;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UILabel *loactionLabel;
- (IBAction)dismissKeyboard:(id)sender;

@end
