//
//  WorkstationSetupViewController.h
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-18.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkstationContentViewController.h"
#import "WorkstationIntroEndViewController.h"
#import "Constants.h"
#import "AppDelegate.h"

@class AppDelegate;


@interface WorkstationSetupViewController : UIViewController <UIPageViewControllerDataSource> {
    AppDelegate *appDelegate;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
