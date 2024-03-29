//
//  SBLoginViewController.m
//  Study Buddy
//
//  Created by Christopher Nolan on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBMainViewController.h"
#import "SBLoginViewController.h"
#import "SBSignUpViewController.h"


@interface SBMainViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testLabel;
@property BOOL *checkUser;

@end

@implementation SBMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popShit) name:@"Fuck Shit" object:nil];
    if ([PFUser currentUser]) {
        self.testLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
        
    } else {
        self.testLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
    
    self.checkUser = NO;
}
- (IBAction)logoutButtonClicked:(id)sender {
    [PFUser logOut];
    [self updateUser];
}
- (void)viewDidAppear:(BOOL)animated
{
    if(![PFUser currentUser]) {
        [self updateUser];
    }
}

-(void)updateUser
{
    SBLoginViewController *loginVC = [[SBLoginViewController alloc] init];
    SBSignUpViewController *signUp = [[SBSignUpViewController alloc] init];
    loginVC.delegate = self;
    loginVC.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsSignUpButton | PFLogInFieldsLogInButton;
    loginVC.logInView.logo = [[UILabel alloc] init];
    
    
    [loginVC setSignUpController:signUp];
    signUp.signUpView.logo = [[UILabel alloc] init];
    
    [self presentViewController:loginVC animated:YES completion:NULL];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"test3.jpg"]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:^{

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         myVC = (SBFirstChoiceViewController *)[storyboard instantiateViewControllerWithIdentifier:@"firstChoiceVC"];
        [self presentViewController:myVC animated:YES completion:nil];


    }];
    
    NSLog(@"User has logged in!");
    _checkUser = YES;
}

-(void) popShit
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
