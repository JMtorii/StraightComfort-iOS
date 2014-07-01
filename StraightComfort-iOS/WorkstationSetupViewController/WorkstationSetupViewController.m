//
//  WorkstationSetupViewController.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-18.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationSetupViewController.h"

@interface WorkstationSetupViewController ()

@end

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
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    self.navigationItem.title = @"Full Workstation Shortcut";
    
    // Set pages data
    groupIndex = 0;
    
    workstationArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"plist"]];
    
    //initialize
    [self initTitles];
    [self initCurDescArray];
    [self initCurDescKeys];
    
    NSLog(@"%d #######", [self.descImages count]);
    for (NSString *str in self.titles) {
        NSLog(@"Titles: %@", str);
    }
    
    
        
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupPageViewController"];
    self.pageViewController.dataSource = self;
        
    WorkstationContentViewController *startingViewController = [self viewControllerAtIndex:0];
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

- (WorkstationContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.descImages count] == 0) || (index >= [self.descImages count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    WorkstationContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupContentViewController"];
//    pageContentViewController.imageFile = self.pageImages[index];
//    pageContentViewController.descLabel = 
    pageContentViewController.pageIndex = index;
    NSString *str = [[self.curDescArray objectAtIndex:index] objectForKey:[self.descImages objectAtIndex:index]];
    NSString *str1 = @"sdfsafa";
    [pageContentViewController setText:str];
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((WorkstationContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((WorkstationContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.descImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.descImages count];
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
//    self.curDescDictionary = [descDictionary copy];
    self.curDescArray = [[workstationArray objectAtIndex:groupIndex] objectForKey:[self.titles objectAtIndex:groupIndex]];
    self.navigationItem.title = [self.titles objectAtIndex:groupIndex];
    
//    [self initCurDescKeys];
}

- (void)initCurDescKeys
{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in self.curDescArray) {
        [tmp addObject:[[dict allKeys] objectAtIndex:0]];
    }
    
    self.descImages = tmp;
//    self.descKeys = [[[self.curDescDictionary allKeys] reverseObjectEnumerator] allObjects];
}



@end
