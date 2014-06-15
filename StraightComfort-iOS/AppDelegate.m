//
//  AppDelegate.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 3/3/2014.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:kChampagneLimousinesBold size:22.0], NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
//    UIButton *rightHelpBarButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    [[UIBarButtonItem appearance] setR:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

      // this will definitely not work
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHelpBarButton];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasPerformedFirstLaunch"]) {
        // On first launch, this block will execute
        mainStoryboard = [UIStoryboard storyboardWithName:@"MainViewController" bundle: nil];
        navController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"MainViewNavigationController"];
        
        // Set the "hasPerformedFirstLaunch" key so this block won't execute again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasPerformedFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else {
        // On subsequent launches, this block will execute
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
