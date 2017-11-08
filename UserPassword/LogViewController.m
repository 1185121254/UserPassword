//
//  LogViewController.m
//  UserPassword
//
//  Created by administrator on 13-9-10.
//  Copyright (c) 2013年 administrator. All rights reserved.
//

#import "LogViewController.h"
#import "FMDatabase.h"
#import  <sqlite3.h>
#import "ViewController.h"
@interface LogViewController ()

@end

@implementation LogViewController

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
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataBasePath = [document stringByAppendingPathComponent:@"UserMessege1.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dataBasePath];
    if (![database open])
    {
        NSLog(@"Open database failed");
        
    }
    [database executeUpdate:@"create table usertable (name text,password text)"];
    [database close];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)logUserButton:(id)sender
{
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dataBasePath = [document stringByAppendingPathComponent:@"UserMessege1.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dataBasePath];
    if (![database open])
    {
        NSLog(@"Open database failed");
        
    }
    
    
    if (self.nameText.text.length == 0||self.passwordText.text.length == 0||self.surePasswordText.text.length == 0)
        {
            UIAlertView *av = [[UIAlertView alloc]
                           initWithTitle:@"提示"
                           message:@"信息填写不完全"
                           delegate:nil
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles:nil];
            [av show];
            [database close];
            return;
        
        }
       else if(![self.passwordText.text isEqualToString:self.surePasswordText.text])
        {
             UIAlertView *av = [[UIAlertView alloc]
                           initWithTitle:@"提示"
                           message:@"两次密码输入不一致"
                           delegate:nil
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles:nil];
            [database close];
            [av show];
            return;
        }
      else
        {
            //查询数据库中数据，监测添加的name是否已经存在
           FMResultSet *result = [database executeQuery:@"select name from usertable "];
            while ([result next]) {
                if ([self.nameText.text  isEqualToString:[result stringForColumn:@"name"]]) {
                    
                    UIAlertView *av = [[UIAlertView alloc]
                                       initWithTitle:@"提示"
                                       message:@"该用户已注册"
                                       delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
                    [database close];
                    [av show];
                    return;
                }
            }
            
        BOOL insert = [database executeUpdate:@"insert into usertable values (?,?)",self.nameText.text,self.passwordText.text];
         if (insert)
          {
             UIAlertView *av = [[UIAlertView alloc]
                           initWithTitle:@"提示"
                           message:@"注册成功"
                           delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil];
              [database close];
             [av show];
        
         }
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
