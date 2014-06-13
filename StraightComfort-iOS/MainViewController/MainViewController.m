//
//  MainViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-16.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    homeTitlesLine1 = [NSArray arrayWithObjects:@"FULL", @"WORKSTATION", @"DISCOMFORT", nil];
    homeTitlesLine2 = [NSArray arrayWithObjects:@"WORKSTATION SETUP", @"SHORTCUT", @"", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [homeTitlesLine1 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MainTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *firstLine = (UILabel *)[cell viewWithTag:100];
    firstLine.text = [homeTitlesLine1 objectAtIndex:indexPath.row];
    firstLine.font = [UIFont fontWithName:kChampagneLimousinesBold size:30];
    
    UILabel *secondLine = (UILabel *)[cell viewWithTag:101];
    secondLine.text = [homeTitlesLine2 objectAtIndex:indexPath.row];
    secondLine.font = [UIFont fontWithName:kChampagneLimousinesBold size:30];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController;
    
    if (indexPath.row == 0) {
        
        
    } else if (indexPath.row == 1) {
        viewController = [[ShortcutViewController alloc]initWithNibName:@"ShortcutViewController" bundle:nil];
        
    } else {
        viewController = [[DiscomfortViewController alloc]initWithNibName:@"DiscomfortTableViewController" bundle:nil];
    }
    
    [[self navigationController] pushViewController:viewController animated:YES];
}


@end
