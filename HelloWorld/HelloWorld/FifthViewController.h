//
//  FifthViewController.h
//  HelloWorld
//
//  Created by Default on 7/18/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FifthViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate , UIActionSheetDelegate , UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionViewTest;
@property (weak, nonatomic) IBOutlet UITextField *TextTextField;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)closeKeyBoard:(id)sender;

- (IBAction)popUpBtn:(id)sender;
@end
