//
//  SBSecondViewController.m
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/18/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBSecondViewController.h"

@interface SBSecondViewController ()

@end

@implementation SBSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
