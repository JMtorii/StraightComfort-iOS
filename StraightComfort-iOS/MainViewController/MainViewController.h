//
//  MainViewController.h
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-16.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ShortcutTableViewController.h"
#import "AppDelegate.h"

/**
 * This is the first view controller that is launched.
 * Currently, the storyboard is used which holds the navigation controller and makes this the root
 * view controller. The MainTableViewCell and MainViewNavigationController class are not used.
 */

@interface MainViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>


@end
