//
//  ShortcutTableViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-24.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "ShortcutViewController.h"

@implementation ShortcutViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Workstation Shortcut";
    
//    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    workstationShortcutArray = [NSArray arrayWithObjects:@"CHAIR", @"KEYBOARD TRAY", @"MOUSE", @"MONITOR", @"DOCUMENTS", @"ORGANIZATION", nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // this UIViewController is about to re-appear, make sure we remove the current selection in our table view
    NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
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
    return [workstationShortcutArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (IS_IPHONE) ? 90 : 180;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tableIdentifier = (IS_IPHONE) ? @"ShortcutTableViewCell_iPhone" : @"ShortcutTableViewCell_iPad";
    ShortcutTableViewCell *cell = (ShortcutTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    } 
    
    cell.shorcutTitleLabel.text = [workstationShortcutArray objectAtIndex:indexPath.row];
    cell.shorcutTitleLabel.textColor = [UIColor colorWithRed:15.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.shorcutTitleLabel.font = (IS_IPHONE) ? [UIFont fontWithName:kRobotoRegular size:22] : [UIFont fontWithName:kRobotoRegular size:34];
    
    UIImage *thumbnailImage;
    
    switch (indexPath.row) {
        case 0:
            thumbnailImage = [UIImage imageNamed:@"chair.png"];
            break;
        case 1:
            thumbnailImage = [UIImage imageNamed:@"keyboard.png"];
            break;
        case 2:
            thumbnailImage = [UIImage imageNamed:@"mouse.png"];
            break;
        case 3:
            thumbnailImage = [UIImage imageNamed:@"monitor.png"];
            break;
        case 4:
            thumbnailImage = [UIImage imageNamed:@"documents.png"];
            break;
        case 5:
            thumbnailImage = [UIImage imageNamed:@"workarea.png"];
            break;
        default:
            break;
    }
    
    cell.thumbnailImageView.image = thumbnailImage;
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    appDelegate.groupIndex = 0;
    appDelegate.workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];
    appDelegate.titles = [[NSArray alloc] initWithObjects:[[workstationShortcutArray objectAtIndex:indexPath.row] capitalizedString], nil];
    appDelegate.maxGroupIndex = 0;
    
    NSLog(@"%@", [[workstationShortcutArray objectAtIndex:indexPath.row] capitalizedString]);
    
    NSString *storyboardName = (IS_IPHONE) ? @"WorkstationSetupViewController_iPhone" : @"WorkstationSetupViewController_iPad";
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"WorkstationSetupViewController"];
    [[self navigationController] pushViewController:viewController animated:YES];
    
}


@end
