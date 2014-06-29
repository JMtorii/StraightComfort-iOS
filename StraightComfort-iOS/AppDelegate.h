//
//  AppDelegate.h
//  StraightComfort-iOS
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
    int groupIndex;
}

@property (strong, nonatomic) UIWindow *window;
@property int groupIndex;

@end
