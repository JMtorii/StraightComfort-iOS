//
//  MainViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-16.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController {
    NSArray *mHomeTitlesLine1;
    NSArray *mHomeTitlesLine2;
    UIStoryboard *mMainStoryboard;
    UINavigationController *mNavController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    mHomeTitlesLine1 = [NSArray arrayWithObjects:@"FULL", @"WORKSTATION", @"DISCOMFORT", nil];
    mHomeTitlesLine2 = [NSArray arrayWithObjects:@"WORKSTATION SETUP", @"SHORTCUT", @"", nil];
    
    mMainStoryboard = [UIStoryboard storyboardWithName:@"MainViewController" bundle: nil];
    mNavController = (UINavigationController*)[mMainStoryboard instantiateViewControllerWithIdentifier: @"MainViewNavigationController"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mHomeTitlesLine1 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MainTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *line1 = (UILabel *)[cell viewWithTag:100];
    line1.text = [mHomeTitlesLine1 objectAtIndex:indexPath.row];
    line1.font = [UIFont fontWithName:kChampagneLimousinesBold size:30];
    
    UILabel *line2 = (UILabel *)[cell viewWithTag:101];
    line2.text = [mHomeTitlesLine2 objectAtIndex:indexPath.row];
    line2.font = [UIFont fontWithName:kChampagneLimousinesBold size:30];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }
    
}


@end
