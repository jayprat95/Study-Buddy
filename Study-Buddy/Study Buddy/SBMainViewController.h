//
//  SBLoginViewController.h
//  Study Buddy
//
//  Created by Christopher Nolan on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SBFirstChoiceViewController.h"

@interface SBMainViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
{
    SBFirstChoiceViewController *myVC;
}
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end
