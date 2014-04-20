//
//  SBSecondTableTableViewController.m
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "SBSecondTableTableViewController.h"
#import "SBThirdTableViewController.h"
#import <Parse/Parse.h>
@interface SBSecondTableTableViewController ()
@property (strong, atomic) NSArray *classesArray;
@end

@implementation SBSecondTableTableViewController

static NSString *cellIdentifier;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars=NO;
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationItem.title = @"Majors";
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    self.classesArray = [[NSArray alloc] initWithObjects:@"AAEC" , @"ACIS" , @"AEE" , @"AFST" , @"AHRM" , @"AINS" , @"ALHR" , @"ALS" , @"AOE" , @"APS" , @"APSC" , @"ARBC" , @"ARCH" , @"ART" , @"AS" , @"ASPT" , @"AT" , @"BC" , @"BCHM" , @"BIOL" , @"BIT" , @"BMES" , @"BMSP" , @"BMVS" , @"BSE" , @"BTDM" , @"C21S" , @"CEE" , @"CEP" , @"CHE" , @"CHEM" , @"CHN" , @"CINE" , @"CLA" , @"CMDA" , @"CNST" , @"COMM" , @"COS" , @"CS" , @"CSES" , @"DASC" , @"ECE" , @"ECON" , @"EDCI" , @"EDCO" , @"EDCT" , @"EDEL" , @"EDEP" , @"EDHE" , @"EDIT" , @"EDP" , @"EDRE" , @"EDTE" , @"ENGE" , @"ENGL" , @"ENGR" , @"ENSC" , @"ENT" , @"ESM" , @"FA" , @"FIN" , @"FIW" , @"FL" , @"FNAD" , @"FOR" , @"FR" , @"FST" , @"GBCB" , @"GEOG" , @"GEOS" , @"GER" , @"GIA" , @"GR" , @"GRAD" , @"HD" , @"HEB" , @"HIST" , @"HNFE" , @"HORT" , @"HTM" , @"HUM" , @"IDS" , @"IS" , @"ISC" , @"ISE" , @"ITAL" , @"ITDS" , @"JPN" , @"JUD" , @"LAHS" , @"LAR" , @"LAT" , @"LDRS" , @"MACR" , @"MATH" , @"ME" , @"MGT" , @"MINE" , @"MKTG" , @"MN" , @"MS" , @"MSE" , @"MTRG" , @"MUS" , @"NANO" , @"NEUR" , @"NR" , @"NSEG" , @"PAPA" , @"PHIL" , @"PHS" , @"PHYS" , @"PORT" , @"PPWS" , @"PSCI" , @"PSVP" , @"PSYC" , @"REAL" , @"RLCL" , @"RUS" , @"SBIO" , @"SOC" , @"SPAN" , @"SPIA" , @"STAT" , @"STS" , @"SYSB" , @"TA" , @"UAP" , @"UH" , @"UNIV" , @"VM" , @"WGS", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    cellIdentifier = @"rowCell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//3</pre>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.classesArray count];
}

//4
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [self.classesArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *queryString = cell.textLabel.text;
    PFQuery *query = [PFQuery queryWithClassName:@"Alpha"];
    NSLog(@"query: %@", queryString);
    [query whereKey:@"Name" equalTo:queryString];
    [[PFUser currentUser] setValue:queryString forKey:@"major"];
    [[PFUser currentUser] saveInBackground];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                NSArray *coursesArray = [NSArray arrayWithArray:[object objectForKey:@"Courses"]];
                SBThirdTableViewController *thirdTable = [[SBThirdTableViewController alloc] init];
                thirdTable.coursesArray = [NSArray arrayWithArray:coursesArray];
                [self.navigationController pushViewController:thirdTable animated:YES]; 
            }
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        
    }];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
