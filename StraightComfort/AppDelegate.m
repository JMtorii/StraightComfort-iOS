//
//  AppDelegate.m
//  StraightComfort
//
//  Created by Jun Torii on 3/3/2014.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize groupIndex = _groupIndex;


// This is not the best implementation
// If this doesn't work, put "Main storyboard file base name" -> String -> MainViewController in plist
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
//    UIPageControl *pageControl = [UIPageControl appearance];
    UIPageControl *pageControl = [UIPageControl appearanceWhenContainedIn:[WorkstationSetupViewController class], nil];

    pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.backgroundColor = [UIColor colorWithRed:30.0/255.0 green:174.0/255.0 blue:252.0/255.0 alpha:1.0];
    
    self.groupIndex = 0;
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasPerformedFirstLaunch"]) {
        // On first launch, this block will execute
        NSString *storyboardName = (IS_IPHONE) ? @"TutorialViewController_iPhone" : @"TutorialViewController_iPad";
        mainStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        navController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"TutorialViewNavigationController"];
//        TutorialViewController *tutorialViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialViewController"];
        self.window.rootViewController = navController;
        
        // Override point for customization after application launch.
//        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
//        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
//        pageControl.backgroundColor = [UIColor whiteColor];
        
        navController.navigationBar.hidden = YES;
        
        // Set the "hasPerformedFirstLaunch" key so this block won't execute again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasPerformedFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        // On subsequent launches, this block will execute
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:kRobotoMedium size:22.0], NSFontAttributeName, nil]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        
        NSString *storyboardName = [[NSString alloc] init];
        storyboardName = (IS_IPHONE) ? @"MainViewController_iPhone" : @"MainViewController_iPad";
        mainStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        navController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"MainViewNavigationController"];
        self.window.rootViewController = navController;
    }

    
    [self.window makeKeyAndVisible];
    
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

- (void)goToMainViewController
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:kRobotoMedium size:22.0], NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSString *storyboardName = [[NSString alloc] init];
    storyboardName = (IS_IPHONE) ? @"MainViewController_iPhone" : @"MainViewController_iPad";
    mainStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    navController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"MainViewNavigationController"];
    self.window.rootViewController = navController;
}

- (void)initTitles
{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in self.workstationArray) {
        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
    }
    
    self.titles = tmp;
    
    self.maxGroupIndex = (int)[self.titles count] - 1;
}

- (void)initCurDescArray
{
    for (NSDictionary *dict in self.workstationArray) {
        if ([dict objectForKey:[self.titles objectAtIndex:self.groupIndex]]) {
            self.curDescArray = [dict objectForKey:[self.titles objectAtIndex:self.groupIndex]];
            break;
        }
    }
    
}

- (void)initCurDescKeys
{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in self.curDescArray) {
        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
    }
    
    self.descImages = tmp;
}

@end
