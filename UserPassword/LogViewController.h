//
//  LogViewController.h
//  UserPassword
//
//  Created by administrator on 13-9-10.
//  Copyright (c) 2013年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *surePasswordText;
- (IBAction)back:(id)sender;

- (IBAction)logUserButton:(id)sender;
@end
