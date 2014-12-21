//
//  TutorialViewController.h
//  StraightComfort
//
//  Created by Mark Torii on 6/15/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialContentViewController.h"
#import "Constants.h"

@interface TutorialViewController : UIViewController <UIPageViewControllerDataSource> {
    NSArray *tutorialArray;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageDesc;
@property (strong, nonatomic) NSArray *pageImages;


- (void) generatePageTitles;
- (void) generatePageImages;
- (void) generatePageDesc;


@end
