//
//  MainViewController.m
//  UserPassword
//
//  Created by chaojie on 2017/8/16.
//  Copyright © 2017年 administrator. All rights reserved.
//

#import "MainViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y);
    btn.bounds = CGRectMake(0, 0, 60, 60);
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)btnClick:(UIButton *)btn{
    
    //https://www.youtube.com/watch?v=T3Yw3gSVI9Q
    NSURL *movieUrl = [[NSURL alloc] initWithString:@"https://www.youtube.com/watch?v=T3Yw3gSVI9Q"];
    
//    MPMoviePlayerController *myMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieUrl];
//    myMoviePlayer.view.frame = CGRectMake(250, 250, 350, 350);
//    [self.view addSubview:myMoviePlayer.view];
//    myMoviePlayer.shouldAutoplay = YES;
//    myMoviePlayer.scalingMode= MPMovieScalingModeAspectFit;
//    [myMoviePlayer play];

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
