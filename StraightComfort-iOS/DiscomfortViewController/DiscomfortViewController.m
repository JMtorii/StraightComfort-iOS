//
//  DiscomfortTableViewController.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 5/26/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "DiscomfortViewController.h"

@implementation DiscomfortViewController

@synthesize analyzeButton = _analyzeButton;
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Discomfort";
    discomfortArray = [NSArray arrayWithObjects:@"NECK", @"UPPER BACK", @"LOWER BACK", @"WRISTS", @"LEGS", nil];
    
    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.scrollEnabled = false;
    
    [self.analyzeButton addTarget:self action:@selector(analyzeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [discomfortArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"DiscomfortTableViewCell";
    DiscomfortTableViewCell *cell = (DiscomfortTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.discomfortTitle.text = [discomfortArray objectAtIndex:indexPath.row];
    cell.discomfortTitle.textColor = [UIColor colorWithRed:15.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.discomfortTitle.font = [UIFont fontWithName:kChampagneLimousinesBold size:24];
        
//    NSLog([cell.discomfortSwitch isOn] ? @"Yes" : @"No");
    
    return cell;
}

- (IBAction)analyzeButtonPressed:(id)sender {
    NSLog(@"myButtonPressed");
    
    NSMutableArray *analyzeElements = [[NSMutableArray alloc]init];
    
    for (int row = 0; row < [self.tableView numberOfRowsInSection:0]; row++) {
        NSIndexPath* cellPath = [NSIndexPath indexPathForRow:row inSection:0];
        DiscomfortTableViewCell* cell = (DiscomfortTableViewCell *)[self.tableView cellForRowAtIndexPath:cellPath];
        [analyzeElements addObject:([cell.discomfortSwitch isOn] ? @"Y" : @"N")];
        NSLog([cell.discomfortSwitch isOn] ? @"Y" : @"N");
    }
    
    PossibleSolutionViewController *possibleSolutionViewController = [[PossibleSolutionViewController alloc]initWithNibName:@"PossibleSolutionViewController" bundle:nil];;
//    possibleSolutionViewController.possibleSolutionSwitches = analyzeElements;
    possibleSolutionViewController.possibleSolutionSwitches = [analyzeElements copy];
    
//    NSLog(@"analyze");
//    for (NSString *switchStatus in possibleSolutionViewController.possibleSolutionSwitches) {
//        NSLog(@"%@", switchStatus);
//    }
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationController] pushViewController:possibleSolutionViewController animated:YES];
}


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
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 */

@end
