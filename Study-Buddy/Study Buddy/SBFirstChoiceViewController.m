//
//  SBFirstChoiceViewController.m
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBFirstChoiceViewController.h"
#import "SBSecondTableTableViewController.h"
#import "SBSecondOptionsViewController.h"
@interface SBFirstChoiceViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSelector;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderPrefSelector;
@property (strong, nonatomic) IBOutlet UISegmentedControl *learningStyleSelector;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sensePreferenceSelector;
@property (strong, nonatomic) IBOutlet UISegmentedControl *studyPreferenceSelector;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberView;
@property NSString *universityName;
@property NSString *genderName;
@property NSString *genderPrefName;
@property NSString *learningStyle;
@property NSString *sensePreference;
@property NSString *numberPreference;
@property NSString *studyPref;

@end

@implementation SBFirstChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"test3.jpg"]]];
        self.universityName = @"Virginia Tech";

 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)genderSelectorClicked:(id)sender {
    _genderName = [_genderSelector titleForSegmentAtIndex:[_genderSelector selectedSegmentIndex]];
}
- (IBAction)genderPreferenceClicked:(id)sender {
    _genderPrefName = [_genderPrefSelector titleForSegmentAtIndex:[_genderPrefSelector selectedSegmentIndex]];
}
- (IBAction)learningStyleClicked:(id)sender {
    _learningStyle = [_learningStyleSelector titleForSegmentAtIndex:[_learningStyleSelector selectedSegmentIndex]];
}
- (IBAction)studyPrefClicked:(id)sender {
    _studyPref = [_studyPreferenceSelector titleForSegmentAtIndex:[_studyPreferenceSelector selectedSegmentIndex]];
}
- (IBAction)sensePrefClicked:(id)sender {
    _sensePreference = [ _sensePreferenceSelector titleForSegmentAtIndex:[_sensePreferenceSelector selectedSegmentIndex]];
}
- (IBAction)nextButtonClicked:(id)sender {
    _genderName = [_genderSelector titleForSegmentAtIndex:[_genderSelector selectedSegmentIndex]];
    NSLog(@"the gender: %@", _genderName);
    [[PFUser currentUser] setObject:_genderName forKey:@"gender"];
    [[PFUser currentUser] setObject:_universityName forKey:@"university"];
    [[PFUser currentUser] setObject:_sensePreference forKey:@"sense"];
    NSString *genderName = [[PFUser currentUser] objectForKey:@"gender"];
    NSLog(@"hello!!!: %@", genderName);
    [[PFUser currentUser] setObject: _genderPrefName forKey:@"genderPrefName" ];
    [[PFUser currentUser] setObject: _learningStyle forKey:@"learningStyle" ];
    [[PFUser currentUser] setObject: _studyPref forKey:@"genderPrefName" ];
    SBSecondOptionsViewController  *sbVC = [[SBSecondOptionsViewController alloc] init];
    [self presentViewController:sbVC animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
#pragma mark - 
#pragma mark picker delegate methods 
//
//- (NSInteger)numberOfComponentsInPickerView:
//(UIPickerView *)pickerView
//{
//    return 1;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView
//numberOfRowsInComponent:(NSInteger)component
//{
//    return _universityNames.count;
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row
//            forComponent:(NSInteger)component
//{
//    return _universityNames[row];
//}
//
//-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//    NSLog(@"%@", _universityNames[row]);
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    return 200;
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    return 50;
//}

// returns the number of 'columns' to display.



@end
