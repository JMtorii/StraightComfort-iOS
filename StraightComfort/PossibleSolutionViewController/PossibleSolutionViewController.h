//
//  PossibleSolutionViewController.h
//  StraightComfort
//
//  Created by Jun Torii on 2014-06-05.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PossibleSolutionTableViewCell.h"
#import "Constants.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface PossibleSolutionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *completeSectionNames;
    NSDictionary *completePossibleSolutionDictionary;
    NSMutableArray *finalSectionNames;
    NSArray *allRawDataArray;
    AppDelegate *appDelegate;
}

- (void)initSectionNames;
- (NSMutableArray *) getPointDescLabels:(int)index;

@property(nonatomic) NSArray *possibleSolutionSwitches;
@property (nonatomic, weak) IBOutlet UITableView *tableView;


@end
