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
    
//    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.analyzeButton addTarget:self action:@selector(analyzeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
    return (IS_IPHONE_5) ? 85 : 66.5;
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
    cell.discomfortTitle.font = [UIFont fontWithName:kRobotoRegular size:22];
        
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
    possibleSolutionViewController.possibleSolutionSwitches = [analyzeElements copy];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationController] pushViewController:possibleSolutionViewController animated:YES];
}

@end
