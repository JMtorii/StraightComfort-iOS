//
//  MainViewController.m
//  StraightComfort
//
//  Created by Jun Torii on 2014-05-16.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // Initialize table data
    homeTitlesLine1 = [NSArray arrayWithObjects:@"FULL", @"WORKSTATION", @"DISCOMFORT", nil];
    homeTitlesLine2 = [NSArray arrayWithObjects:@"WORKSTATION SETUP", @"SHORTCUT", @"", nil];
    
//    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomVi'ew:rightHelpBarButton];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (IS_IPHONE_6) {
        return 200;
    } else if (IS_IPHONE_6P) {
        return 232;
    } else if (IS_IPHONE_5) {
        return 168;
    } else if (IS_IPHONE && !IS_IPHONE_5) {
        return 140;
    } else {
        return 320;
    }
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
    
    UILabel *secondLine = (UILabel *)[cell viewWithTag:101];
    secondLine.text = [homeTitlesLine2 objectAtIndex:indexPath.row];
    
    if (IS_IPHONE) {
        firstLine.font = [UIFont fontWithName:kRobotoRegular size:25];
        secondLine.font = [UIFont fontWithName:kRobotoRegular size:25];
    } else {
        firstLine.font = [UIFont fontWithName:kRobotoRegular size:40];
        secondLine.font = [UIFont fontWithName:kRobotoRegular size:40];
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController;
    
    if (indexPath.row == 0) {
        appDelegate.groupIndex = 0;
        appDelegate.workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];
        [appDelegate initTitles];
        NSString *storyboardName = (IS_IPHONE) ? @"WorkstationSetupViewController_iPhone" : @"WorkstationSetupViewController_iPad";
        UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
        viewController = [sb instantiateViewControllerWithIdentifier:@"WorkstationSetupViewController"];
        
    
    } else if (indexPath.row == 1) {
        viewController = [[ShortcutViewController alloc]initWithNibName:@"ShortcutViewController" bundle:nil];
        
    } else {
        viewController = [[DiscomfortViewController alloc]initWithNibName:@"DiscomfortViewController" bundle:nil];
    
    }
    
    [[self navigationController] pushViewController:viewController animated:YES];
}


@end
