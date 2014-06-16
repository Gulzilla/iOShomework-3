//
//  YHOOStreamViewController.m
//  FaceBook
//
//  Created by Tom Gulik on 6/16/14.
//  Copyright (c) 2014 Tom Gulik. All rights reserved.
//

#import "YHOOStreamViewController.h"

@interface YHOOStreamViewController ()

@end

@implementation YHOOStreamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        //self.title = @"News Feed";
        //self.view.backgroundColor = [UIColor colorWithRed:0.31 green:0.38 blue:0.62 alpha:1.0];
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
