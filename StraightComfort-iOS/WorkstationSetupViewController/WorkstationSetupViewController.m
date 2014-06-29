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

@synthesize pageImages = _pageImages;
@synthesize titles = _titles;
@synthesize curDescDictionary = _curDescDictionary;

static int groupIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    self.navigationItem.title = @"Full Workstation Shortcut";
    
    _pageImages = @[@"welcomePage1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WorkstationSetupStrings" ofType:@"xml"];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:path]];
    WorkstationSetupXMLParser *parser = [[WorkstationSetupXMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    BOOL success = [xmlParser parse];
    
    if(success){
        NSLog(@"No Errors");
    }
    else{
        NSLog(@"Error Error Error!!!");
    }
    
    // Set pages data
    groupIndex = 0;
    
    [self initTitles:[[parser getDictionary] allKeys]];
    [self initCurDescDictionary:[[parser getDictionary] objectForKey:[self.titles objectAtIndex:groupIndex]]];
    
    NSLog(@"%d #######", [self.descKeys count]);
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
    NSLog(@"HEY: %d", [self.titles count]);
    if (([self.curDescDictionary count] == 0) || (index >= [self.curDescDictionary count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    WorkstationContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkstationSetupContentViewController"];
//    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    
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
    if (index == [self.curDescDictionary count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.curDescDictionary count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)initTitles:(NSArray *)parserTitles
{
    self.titles = [[parserTitles reverseObjectEnumerator] allObjects];;
}


- (void)initCurDescDictionary:(NSMutableDictionary *)descDictionary
{
    self.curDescDictionary = [descDictionary copy];
    self.navigationItem.title = [self.titles objectAtIndex:groupIndex];
    
    [self initCurDescKeys];
}

- (void)initCurDescKeys
{
    self.descKeys = [[[self.curDescDictionary allKeys] reverseObjectEnumerator] allObjects];
}



@end
