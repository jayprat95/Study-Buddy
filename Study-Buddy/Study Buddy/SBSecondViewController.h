//
//  SBSecondViewController.h
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/18/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SBSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *univTextField;

@end
