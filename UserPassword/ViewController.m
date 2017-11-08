//
//  ViewController.m
//  UserPassword
//
//  Created by administrator on 13-9-10.
//  Copyright (c) 2013年 administrator. All rights reserved.
//

#import "ViewController.h"
#import "LogViewController.h"
#import "FMDatabase.h"
#import <sqlite3.h>
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataBasePath = [document stringByAppendingPathComponent:@"UserMessege1.sqlite"];
    database = [FMDatabase databaseWithPath:dataBasePath];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"sanbox:%@",NSHomeDirectory());
    
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarClick:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    
    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"osVersion:%@",osVersion);

    
}

-(void)rightBarClick:(UIBarButtonItem *)barClick{
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    
    [self presentViewController:mainVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logButton:(id)sender {
    LogViewController *log = [[LogViewController alloc]init];
    [self presentViewController:log animated:YES completion:nil];
    
    
}

- (IBAction)landButton:(id)sender {
    
    if (![database open])
        
    {
        NSLog(@"Open database failed");
        
    }
   FMResultSet *result = [database executeQuery:@"select * from usertable"];
   while([result next])
   {

       if ([self.passwordStr.text isEqualToString:[result stringForColumn:@"password"]] && [self.nameStr.text isEqualToString:[result stringForColumn:@"name"]])
        {
      
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示"
                           message:@"登录成功"
                           delegate:nil
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles:nil];
            [av show];
             [database close];
            return;
        
        }
        else if ([self.nameStr.text isEqualToString:[result stringForColumn:@"name"]] && ![self.passwordStr.text isEqualToString:[result stringForColumn:@"password"]])
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"密码错误"
                                                        delegate:nil
                                               cancelButtonTitle:@"Ok"
                                               otherButtonTitles:nil];
            [av show];
            [database close];
            return;

        }
       
    }
   
     [database close];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示"
                                             message:@"用户不存在"
                                            delegate:nil
                                   cancelButtonTitle:@"Ok"
                                   otherButtonTitles:nil];
    [av show];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
