//
//  TutorialViewController.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/15/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tutorialArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TutorialStrings" ofType:@"plist"]];
    
    [self generatePageTitles];
    [self generatePageImages];
    [self generatePageDesc];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialViewController"];
    self.pageViewController.dataSource = self;
    
    TutorialContentViewController *startingViewController = [self viewControllerAtIndex:0];
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


- (TutorialContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    TutorialContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    
    pageContentViewController.titleLabel.text = self.pageTitles[index];
    pageContentViewController.curDescText = self.pageDesc[index];
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void) generatePageTitles
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in tutorialArray) {
        [array addObject:[dict objectForKey:@"title"]];
    }
    
    self.pageTitles = array;
}

- (void) generatePageImages
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in tutorialArray) {
        for (NSString *key in [dict allKeys]) {
            if (![key isEqual:@"title"]) {
                [array addObject:key];
            }
        }
    }
    
    self.pageImages = array;
}

- (void) generatePageDesc
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [tutorialArray count]; i++) {
        [array addObject:[[tutorialArray objectAtIndex:i] objectForKey:[self.pageImages objectAtIndex:i]]];
    }
    
    self.pageDesc = array;
}





@end