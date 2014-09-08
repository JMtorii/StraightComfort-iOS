//
//  PossibleSolutionViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-05.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "PossibleSolutionViewController.h"

@implementation PossibleSolutionViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Possible Solutions";
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
//    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];

    completeSectionNames = [NSArray arrayWithObjects:@"Neck", @"Upper Back", @"Lower Back", @"Wrists", @"Legs", nil];
    completePossibleSolutionDictionary = @{[completeSectionNames objectAtIndex:0]: @[@"Monitor", @"Documents"], 
                                   [completeSectionNames objectAtIndex:1]: @[@"Keyboard Tray (height)"],
                                   [completeSectionNames objectAtIndex:2]: @[@"Chair (backrest height)"],
                                   [completeSectionNames objectAtIndex:3]: @[@"Armrest (usage)", @"Mouse"],
                                   [completeSectionNames objectAtIndex:4]: @[@"Chair (height, seat depth)"]};
    
    [self initSectionNames];
    
    allRawDataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PossibleSolutionStrings" ofType:@"plist"]];
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
    return [finalSectionNames count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 1.0f;
    return 32.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (IS_IPHONE) {
        return 125;
    } else {
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tableIdentifier = (IS_IPHONE) ? @"PossibleSolutionTableViewCell_iPhone" : @"PossibleSolutionTableViewCell_iPad";
    PossibleSolutionTableViewCell *cell = (PossibleSolutionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.possibleSolutionLabel.text = [finalSectionNames objectAtIndex:indexPath.row];
    cell.possibleSolutionLabel.textColor = [UIColor colorWithRed:15.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.possibleSolutionLabel.font = [UIFont fontWithName:kRobotoRegular size:22];
    
    NSArray *descs = [self getPointDescLabels: (int)[completeSectionNames indexOfObject:[finalSectionNames objectAtIndex:indexPath.row]]];
    
    cell.pointDesc1.text = [descs objectAtIndex:0];
    
    
    if ([descs count] > 1) {
        cell.pointDesc2.text = [descs objectAtIndex:1];
    } else {
        cell.pointDesc2.text = @"";
    }
    
    if (IS_IPHONE) {
        cell.possibleSolutionLabel.font = [UIFont fontWithName:kRobotoRegular size:22];
        cell.pointDesc1.font = [UIFont fontWithName:kRobotoRegular size:13];
        cell.pointDesc2.font = [UIFont fontWithName:kRobotoRegular size:13];
    } else {
        cell.possibleSolutionLabel.font = [UIFont fontWithName:kRobotoRegular size:34];
        cell.pointDesc1.font = [UIFont fontWithName:kRobotoRegular size:24];
        cell.pointDesc2.font = [UIFont fontWithName:kRobotoRegular size:24];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int counter = 0;
    int trueIndex = indexPath.row;
    
    for (int i = 0; i < [self.possibleSolutionSwitches count]; i++) {
        if ([[self.possibleSolutionSwitches objectAtIndex:i] isEqualToString:@"Y"]) {
            counter++;
            
            if (counter == indexPath.row + 1) {
                trueIndex = i;
                break;
            }
        }
    }
    
    appDelegate.groupIndex = 0;
    appDelegate.workstationArray = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PossibleSolutionStrings" ofType:@"plist"]] objectAtIndex:trueIndex];
    appDelegate.titles = [self getPointDescLabels:(int)indexPath.row];
    appDelegate.maxGroupIndex = (int)[appDelegate.titles count] - 1;
    
    NSString *storyboardName = (IS_IPHONE) ? @"WorkstationSetupViewController_iPhone" : @"WorkstationSetupViewController_iPad";
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"WorkstationSetupViewController"];
    [[self navigationController] pushViewController:viewController animated:YES];
    
}

- (void) initSectionNames 
{
    BOOL hasOneSectionName = false;
    finalSectionNames = [[NSMutableArray alloc]init];
    for (int index = 0; index < [self.possibleSolutionSwitches count]; index++) {
        if ([[self.possibleSolutionSwitches objectAtIndex:index] isEqualToString:@"Y"]) {
            [finalSectionNames addObject:[completeSectionNames objectAtIndex:index]];
            hasOneSectionName = true;
        }
    }
    
    if (!hasOneSectionName) {
        finalSectionNames = [completeSectionNames copy];
    }
}

// TODO: This needs to be modified 
- (NSMutableArray *) getPointDescLabels:(int)index
{    
    int counter = 0;
    int trueIndex = index;
    
    for (int i = 0; i < [self.possibleSolutionSwitches count]; i++) {
        if ([[self.possibleSolutionSwitches objectAtIndex:i] isEqualToString:@"Y"]) {
            counter++;
            
            if (counter == index + 1) {
                trueIndex = i;
                break;
            }
        }
    }
    
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    // modify index
    for (NSDictionary *dict in [allRawDataArray objectAtIndex:trueIndex]) {
        [retArray addObject:[[dict allKeys] objectAtIndex:0]];
    }
    
    return retArray;
}

@end
