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
@synthesize pageImages = _pageImages;
@synthesize titles = _titles;
@synthesize curDescArray = _curDescArray;
@synthesize descImages = _descImages;

static int groupIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.navigationItem.title = @"Full Workstation Shortcut";
    
    // Set pages data
    groupIndex = 0;
    pageIndex = 0;
    
    workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];
    
    //initialize
    [self initTitles];
    [self initCurDescArray];
    [self initCurDescKeys];
    
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
        
    //    for (UIView *view in self.pageViewController.view.subviews ) {
    //        if ([view isKindOfClass:[UIScrollView class]]) {
    //            UIScrollView *scroll = (UIScrollView *)view;
    //            scroll.bounces = NO;
    //        }
    //    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.descImages count] == 0) || (index >= [self.descImages count] + 2)) {
        return nil;
    }
    
    UIViewController *pageContentViewController;
    if (index == 0) {
        pageContentViewController = (WorkstationIntroEndViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationIntroEndViewController"];
        
    } else if (index == [self.descImages count] + 1) {
        pageContentViewController = (WorkstationIntroEndViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationIntroEndViewController"];
        
    } else {
        pageContentViewController = (WorkstationContentViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupContentViewController"];
        ((WorkstationContentViewController*)pageContentViewController).pageIndex = index;
        ((WorkstationContentViewController*)pageContentViewController).descText = [[self.curDescArray objectAtIndex:(index - 1)] objectForKey:[self.descImages objectAtIndex:(index - 1)]];
        
    }
    
    // Create a new view controller and pass suitable data.
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ((pageIndex == 0) || (pageIndex == NSNotFound)) {
        return nil;
    }
    
    pageIndex--;
    return [self viewControllerAtIndex:pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    if (pageIndex == NSNotFound) {
        return nil;
    }
    
    pageIndex++;
    
    if (pageIndex == [self.descImages count] + 1) {
        return nil;
    }
    return [self viewControllerAtIndex:pageIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.descImages count] + 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)initTitles
{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in workstationArray) {
        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
    }
    
    self.titles = tmp;
}


- (void)initCurDescArray
{
    self.curDescArray = [[workstationArray objectAtIndex:groupIndex] objectForKey:[self.titles objectAtIndex:groupIndex]];
    self.navigationItem.title = [self.titles objectAtIndex:groupIndex];    
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
