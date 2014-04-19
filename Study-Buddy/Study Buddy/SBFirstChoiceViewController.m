//
//  SBFirstChoiceViewController.m
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBFirstChoiceViewController.h"

@interface SBFirstChoiceViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *universityPicker;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSelector;
@property NSString *universityName;
@property NSString *genderName;

@end

@implementation SBFirstChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.universityPicker.delegate = self;
    self.universityPicker.dataSource = self;
    
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
   

    self.universityNames = @[@"Virginia Tech"];
    
      [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"test3.jpg"]]];
 
    
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
- (IBAction)nextButtonClicked:(id)sender {
    _genderName = [_genderSelector titleForSegmentAtIndex:[_genderSelector selectedSegmentIndex]];
    //_universityName =
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
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [self.universityNames count];
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [self.universityNames objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _universityName = [_universityNames objectAtIndex:row];
}


@end
