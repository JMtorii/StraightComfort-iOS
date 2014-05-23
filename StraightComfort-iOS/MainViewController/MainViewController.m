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
}

//@synthesize line1;
//@synthesize line2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize table data
    mHomeTitlesLine1 = [NSArray arrayWithObjects:@"FULL", @"WORKSTATION", @"DISCOMFORT", nil];
    mHomeTitlesLine2 = [NSArray arrayWithObjects:@"WORKSTATION SETUP", @"SHORTCUT", @"", nil];
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
    // TURN THIS INTO A CONST
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
    
    UILabel *line2 = (UILabel *)[cell viewWithTag:101];
    line2.text = [mHomeTitlesLine2 objectAtIndex:indexPath.row];
    
//    cell.textLabel.text = [mHomeTitles objectAtIndex:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    
    return cell;
}


@end
