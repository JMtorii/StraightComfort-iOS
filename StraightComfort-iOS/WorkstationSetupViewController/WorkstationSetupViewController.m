//
//  WorkstationSetupViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-18.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationSetupViewController.h"

@implementation WorkstationSetupViewController

@synthesize pageViewController = _pageViewController;
//@synthesize pageImages = _pageImages;
//@synthesize titles = _titles;
//@synthesize curDescArray = _curDescArray;
//@synthesize descImages = _descImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.navigationItem.title = @"Full Workstation Shortcut";
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSLog(@"%d", appDelegate.groupIndex);
//    appDelegate.workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];
//    workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];

//    [appDelegate initTitles];
    
    if (appDelegate.groupIndex == 0 || appDelegate.groupIndex < [appDelegate.titles count]) {
        
        //initialize
        
        [appDelegate initCurDescArray];
        [appDelegate initCurDescKeys];
        self.navigationItem.title = [appDelegate.titles objectAtIndex:appDelegate.groupIndex];
        
        // Create page view controller
        self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupPageViewController"];
        self.pageViewController.dataSource = self;
        
        UIViewController *startingViewController = [self viewControllerAtIndex:0];
        NSArray *viewControllers = @[startingViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
        // Change the size of page view controller
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
        [self.pageViewController didMoveToParentViewController:self];
        
    }
    
        
    //    for (UIView *view in self.pageViewController.view.subviews ) {
    //        if ([view isKindOfClass:[UIScrollView class]]) {
    //            UIScrollView *scroll = (UIScrollView *)view;
    //            scroll.bounces = NO;
    //        }
    //    }
        
}

-(void) viewDidAppear:(BOOL)animated
{
    
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        if (appDelegate.groupIndex > 0) {
            appDelegate.groupIndex--;
        }
        [self.navigationController popViewControllerAnimated:NO];
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([appDelegate.descImages count] == 0) || (appDelegate.groupIndex == 0 && index >= [appDelegate.descImages count] + 2) || (appDelegate.groupIndex > 0 && index >= [appDelegate.descImages count] + 1)) {
        return nil;
    }
    
    UIViewController *pageContentViewController;
    
    if ((appDelegate.groupIndex == 0 && (index == 0 || index == [appDelegate.descImages count] + 1)) || (appDelegate.groupIndex > 0 && index == [appDelegate.descImages count])) {
        pageContentViewController = (WorkstationIntroEndViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationIntroEndViewController"];
        ((WorkstationIntroEndViewController*)pageContentViewController).pageIndex = index;
        
    } else {
        pageContentViewController = (WorkstationContentViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupContentViewController"];
        ((WorkstationContentViewController*)pageContentViewController).pageIndex = index;
        
        if (appDelegate.groupIndex == 0) {
            ((WorkstationContentViewController*)pageContentViewController).descText = [[appDelegate.curDescArray objectAtIndex:(index - 1)] objectForKey:[appDelegate.descImages objectAtIndex:(index - 1)]];
        } else {
            ((WorkstationContentViewController*)pageContentViewController).descText = [[appDelegate.curDescArray objectAtIndex:index] objectForKey:[appDelegate.descImages objectAtIndex:index]];
        }
    
    }
    
    // Create a new view controller and pass suitable data.
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index;
    if ([viewController isKindOfClass:[WorkstationContentViewController class]] ) {
        index = ((WorkstationContentViewController*) viewController).pageIndex;
    } else {
        index = ((WorkstationIntroEndViewController*) viewController).pageIndex;
    }    
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index;
    if ([viewController isKindOfClass:[WorkstationContentViewController class]] ) {
        index = ((WorkstationContentViewController*) viewController).pageIndex;
    } else {
        index = ((WorkstationIntroEndViewController*) viewController).pageIndex;
    }
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if ((appDelegate.groupIndex == 0 && index == [appDelegate.descImages count] + 2) || (appDelegate.groupIndex > 0 && index == [appDelegate.descImages count] + 1)) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    if (appDelegate.groupIndex == 0) {
        return [appDelegate.descImages count] + 2;
    } else {
        return [appDelegate.descImages count] + 1;
    }
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

//- (void)initTitles
//{
//    NSMutableArray *tmp = [[NSMutableArray alloc]init];
//    for (NSDictionary *dict in workstationArray) {
//        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
//    }
//    
//    self.titles = tmp;
//    
//    appDelegate.maxGroupIndex = [self.titles count] - 1;
//}
//
//
//- (void)initCurDescArray
//{
//    self.curDescArray = [[workstationArray objectAtIndex:appDelegate.groupIndex] objectForKey:[self.titles objectAtIndex:appDelegate.groupIndex]];
//    self.navigationItem.title = [self.titles objectAtIndex:appDelegate.groupIndex];
//}
//
//- (void)initCurDescKeys
//{
//    NSMutableArray *tmp = [[NSMutableArray alloc]init];
//    for (NSDictionary *dict in self.curDescArray) {
//        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
//    }
//    
//    self.descImages = tmp;
//}



@end
