//
//  AppDelegate.h
//  StraightComfort
//
//  Created by Jun Torii on 3/3/2014.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "TutorialViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIStoryboard *mainStoryboard;
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) int groupIndex;
@property (nonatomic) int maxGroupIndex;
@property (strong, nonatomic) NSArray *workstationArray;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *curDescArray;
@property (strong, nonatomic) NSArray *descImages;

- (void)goToMainViewController;
- (void)initTitles;
- (void)initCurDescArray;
- (void)initCurDescKeys;


@end
