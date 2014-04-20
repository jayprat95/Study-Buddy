//
//  SBLoginViewController.h
//  Study Buddy
//
//  Created by Christopher Nolan on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SBMainViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end
