//
//  ShortcutTableViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-24.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "ShortcutViewController.h"

@implementation ShortcutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Workstation Shortcut";
//    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
//    self.navigationItem.rightBarButtonItems = @[helpItem];
    
    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    workstationShortcutArray = [NSArray arrayWithObjects:@"CHAIR", @"KEYBOARD TRAY", @"MOUSE", @"MONITOR", @"DOCUMENTS", @"WORK AREA & STORAGE", nil];
    
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
    return [workstationShortcutArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"ShortcutTableViewCell";
    ShortcutTableViewCell *cell = (ShortcutTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    } 
    
    cell.shorcutTitleLabel.text = [workstationShortcutArray objectAtIndex:indexPath.row];
    cell.shorcutTitleLabel.textColor = [UIColor colorWithRed:15.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.shorcutTitleLabel.font = [UIFont fontWithName:kRobotoRegular size:22];
    
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
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WorkstationSetupViewController" bundle:nil];
    UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"WorkstationSetupViewController"];
    [[self navigationController] pushViewController:viewController animated:YES];
    
}


@end
