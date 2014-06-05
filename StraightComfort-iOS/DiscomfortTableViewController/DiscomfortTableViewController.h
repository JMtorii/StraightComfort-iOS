//
//  DiscomfortTableViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 5/26/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "DiscomfortTableViewCell.h"

@interface DiscomfortTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *discomfortArray;
}

@property (nonatomic, weak) IBOutlet UIButton *analyzeButton;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
