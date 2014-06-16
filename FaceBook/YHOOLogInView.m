//
//  YHOOLogInView.m
//  FaceBook
//
//  Created by Tom Gulik on 6/14/14.
//  Copyright (c) 2014 Tom Gulik. All rights reserved.
//

#import "YHOOLogInView.h"
#import "YHOOStreamViewController.h"

@interface YHOOLogInView ()
@property (weak, nonatomic) IBOutlet UIView *viewLogin;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;

// Outlets
@property (weak, nonatomic) IBOutlet UIImageView *logoFB;
@property (weak, nonatomic) IBOutlet UIView *viewLoginFields;
@property (weak, nonatomic) IBOutlet UITextField *fieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *fieldPassword;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (weak, nonatomic) IBOutlet UILabel *signIn;
@property (weak, nonatomic) IBOutlet UILabel *Help;

@property (weak, nonatomic) IBOutlet UIButton *buttonLogIn;

// Vars
@property (assign, nonatomic) BOOL canLogin;
@property (assign, nonatomic) char loginEmail;
@property (assign, nonatomic) char loginPassword;


- (IBAction)onLoginClick:(id)sender;
- (IBAction)onEditEmail:(id)sender;
- (IBAction)onPasswordEdit:(id)sender;
- (IBAction)onChangeEmail:(id)sender;
- (IBAction)onChangePassword:(id)sender;
- (IBAction)keyboardDismiss:(id)sender;

- (void) moveUp;
- (void) moveDown;
- (void) tryConnect;

@end

@implementation YHOOLogInView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.canLogin = NO;
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewLogin.layer.cornerRadius = 5;
    self.viewBackground.backgroundColor = [UIColor colorWithRed:0.31 green:0.38 blue:0.62 alpha:1.0];
    self.buttonLogIn.backgroundColor = [UIColor colorWithRed:0.34 green:0.40 blue:0.63 alpha:1.0];
    self.buttonLogIn.tintColor = [UIColor whiteColor];
    //self.signIn.tintColor      = [UIColor whiteColor];
    //self.Help.tintColor        = [UIColor whiteColor];
    self.buttonLogIn.layer.cornerRadius = 5;
    
    self.buttonLogIn.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginClick:(id)sender {
    [self.loader startAnimating];
    [self performSelector:@selector(moveDown)];
    [self.view endEditing:YES];
    [self performSelector:@selector(tryConnect) withObject:nil afterDelay:1];
}

- (void) moveUp {
    CGRect FBlogoframe = self.logoFB.frame;
    CGRect LoginView   = self.viewLoginFields.frame;
    CGRect LoginButton = self.buttonLogIn.frame;
    CGRect LoadSpinner = self.loader.frame;
    FBlogoframe.origin.y = 40;
    LoginView.origin.y   = 140;
    LoadSpinner.origin.y = 285;
    LoginButton.origin.y = 280;
    self.logoFB.frame      = FBlogoframe;
    self.viewLogin.frame   = LoginView;
    self.loader.frame      = LoadSpinner;
    self.buttonLogIn.frame = LoginButton;
}

- (void) moveDown {
    CGRect FBlogoframe = self.logoFB.frame;
    CGRect LoginView   = self.viewLoginFields.frame;
    CGRect LoginButton = self.buttonLogIn.frame;
    CGRect LoadSpinner = self.loader.frame;
    FBlogoframe.origin.y = 90;
    LoginView.origin.y   = 190;
    LoadSpinner.origin.y = 335;
    LoginButton.origin.y = 330;
    self.logoFB.frame      = FBlogoframe;
    self.viewLogin.frame   = LoginView;
    self.loader.frame      = LoadSpinner;
    self.buttonLogIn.frame = LoginButton;
}

- (void) tryConnect {
    NSString *loginEmail    = @"guest";
    NSString *loginPassword = @"pass";
    [self.loader stopAnimating];
    if([self.fieldEmail.text isEqualToString:loginEmail] && [self.fieldPassword.text isEqualToString:loginPassword]){
        YHOOStreamViewController *svc = [[YHOOStreamViewController alloc] init];
        svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:svc animated:YES completion:nil];
    } else {
        UIAlertView *wrongLogin = [[UIAlertView alloc] initWithTitle:@"Incorrect Login" message:@"Information you have entered does not match our records.\n Please try your luck again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [wrongLogin show];
        self.fieldEmail.text    = @"";
        self.fieldPassword.text = @"";
    }
}

- (IBAction)onEditEmail:(id)sender {
    [self performSelector:@selector(moveUp)];
}

- (IBAction)onPasswordEdit:(id)sender {
    [self performSelector:@selector(moveUp)];
}

- (IBAction)onChangeEmail:(id)sender {
    if([self.fieldEmail.text isEqualToString:@""]){
        self.buttonLogIn.enabled = NO;
    } else {
        self.buttonLogIn.enabled = YES;
    }
}

- (IBAction)onChangePassword:(id)sender {
    if([self.fieldPassword.text isEqualToString:@""]){
        self.buttonLogIn.enabled = NO;
    } else {
        self.buttonLogIn.enabled = YES;
    }
}

- (IBAction)keyboardDismiss:(id)sender {
    [self.view endEditing:YES];
    [self performSelector:@selector(moveDown)];
}

@end