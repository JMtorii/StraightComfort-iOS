//
//  PossibleSolutionViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-05.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "PossibleSolutionViewController.h"

@implementation PossibleSolutionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Possible Solutions";

    completeSectionNames = [NSArray arrayWithObjects:@"Neck", @"Upper Back", @"Lower Back", @"Wrists", @"Legs", nil];
    completePossibleSolutionDictionary = @{[completeSectionNames objectAtIndex:0]: @[@"Monitor", @"Documents"], 
                                   [completeSectionNames objectAtIndex:1]: @[@"Keyboard Tray (height)", @"Chair (armrest height)"],
                                   [completeSectionNames objectAtIndex:2]: @[@"Chair (backrest height)"],
                                   [completeSectionNames objectAtIndex:3]: @[@"Armrest (usage)", @"Mouse"],
                                   [completeSectionNames objectAtIndex:4]: @[@"Chair (height, seat depth)"]};
    
    [self initSectionNames];
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
    return [finalSectionNames count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[completePossibleSolutionDictionary objectForKey:[finalSectionNames objectAtIndex:section]]count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    return [finalSectionNames objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"PossibleSolutionTableViewCell";
    PossibleSolutionTableViewCell *cell = (PossibleSolutionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.possibleSolutionLabel.text = [[completePossibleSolutionDictionary objectForKey:[finalSectionNames objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    cell.possibleSolutionLabel.textColor = [UIColor colorWithRed:15.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.possibleSolutionLabel.font = [UIFont fontWithName:kChampagneLimousinesBold size:22];
    
    return cell;
}

- (void) initSectionNames {
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



@end
