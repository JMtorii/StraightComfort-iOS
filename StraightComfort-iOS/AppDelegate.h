//
//  AppDelegate.h
//  StraightComfort-iOS
//
//  Created by Jun Torii on 3/3/2014.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIStoryboard *mainStoryboard;
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;



@end
