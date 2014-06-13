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
                                   [completeSectionNames objectAtIndex:1]: @[@"Keyboard Tray", @"Chair"],
                                   [completeSectionNames objectAtIndex:2]: @[@"Chair"],
                                   [completeSectionNames objectAtIndex:3]: @[@"Armrest", @"Mouse"],
                                   [completeSectionNames objectAtIndex:4]: @[@"Chair"]};
    
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
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
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
    
    return cell;
}

- (void) initSectionNames {
    finalSectionNames = [[NSMutableArray alloc]init];
    for (int index = 0; index < [self.possibleSolutionSwitches count]; index++) {
        if ([[self.possibleSolutionSwitches objectAtIndex:index] isEqualToString:@"Y"]) {
            [finalSectionNames addObject:[completeSectionNames objectAtIndex:index]];
        }
    }
}



@end
