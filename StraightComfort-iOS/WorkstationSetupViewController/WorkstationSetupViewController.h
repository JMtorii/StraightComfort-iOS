//
//  WorkstationSetupViewController.h
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-18.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkstationContentViewController.h"
#import "Constants.h"
#import "WorkstationSetupXMLParser.h"


@interface WorkstationSetupViewController : UIViewController <UIPageViewControllerDataSource> {
    NSArray *workstationArray;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *curDescArray;
@property (strong, nonatomic) NSArray *descImages;


- (void)initTitles;
- (void)initCurDescArray;
- (void)initCurDescKeys;
@end
