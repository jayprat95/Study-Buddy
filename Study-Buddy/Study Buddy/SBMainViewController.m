//
//  SBLoginViewController.m
//  Study Buddy
//
//  Created by Christopher Nolan on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBMainViewController.h"
#import "SBLoginViewController.h"

@interface SBMainViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation SBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    if ([PFUser currentUser]) {
        self.testLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    
    
    } else {
        self.testLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
}
- (IBAction)logoutButtonClicked:(id)sender {
    [PFUser logOut];
    [self presentViewController:self animated:NO completion:NULL];
}
- (void)viewDidAppear:(BOOL)animated
{
    if(![PFUser currentUser]) {
        SBLoginViewController *loginVC = [[SBLoginViewController alloc] init];
        loginVC.delegate = self;
        loginVC.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsSignUpButton | PFLogInFieldsLogInButton;

        [self presentViewController:loginVC animated:YES completion:NULL];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
