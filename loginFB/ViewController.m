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
    self.loginButton.delegate = self;
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
#pragma mark FB Delegate methods
//This is called when the user is logged in
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
    //Two simple tasks are performed here: The appropriate message is set as the text of the status label, and the rest of the subviews are becoming visible.
}

//This method contains a FBGraphUser object as parameter, which actually is a NSDictionary object, and it contains all the public info of the logged in user


-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    /*
     I intentionally added a NSLog command in the above method, just to let you see the data contained in the user object. By assigning the id property as the profile ID in the profile picture view, the Facebook SDK downloads the appropriate picture and displays it. If no user picture has been specified, then the default image of the Facebook user will be used. Lastly, the user’s name and the e-mail address values are set to the appropriate labels.
     */
    NSLog(@"%@", user);
    self.profilePicture.profileID = user.objectID;
    self.lblUsername.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
}

//Log out
-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}

//Handle any errors
-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}
@end
