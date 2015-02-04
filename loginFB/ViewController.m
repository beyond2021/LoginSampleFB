//
//  ViewController.m
//  loginFB
//
//  Created by KEEVIN MITCHELL on 2/3/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void)toggleHiddenState:(BOOL)shouldHide;
//all subviews to be hidden until the logged in state is determined, except for the login status label. They should become visible only after a successful login and after their values have been set, otherwise they must remain hidden. We’ll create a small private method to accomplish this

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
}

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
