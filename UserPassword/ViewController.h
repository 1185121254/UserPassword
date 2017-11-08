//
//  ViewController.h
//  UserPassword
//
//  Created by administrator on 13-9-10.
//  Copyright (c) 2013年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface ViewController : UIViewController
{
    FMDatabase *database;
    
}

- (IBAction)logButton:(id)sender;

- (IBAction)landButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameStr;

@property (weak, nonatomic) IBOutlet UITextField *passwordStr;
@end
