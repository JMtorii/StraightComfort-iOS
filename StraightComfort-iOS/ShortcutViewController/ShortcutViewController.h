//
//  ShortcutTableViewController.h
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-24.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShortcutTableViewCell.h"
#import "WorkstationSetupViewController.h"
#import "Constants.h"
#import "AppDelegate.h"

@class AppDelegate;


@interface ShortcutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *workstationShortcutArray;
    AppDelegate *appDelegate;
}

@end
