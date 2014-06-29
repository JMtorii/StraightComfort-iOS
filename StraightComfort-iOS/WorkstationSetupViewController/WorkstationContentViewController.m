//
//  WorkstationContentViewController.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/21/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationContentViewController.h"

@interface WorkstationContentViewController ()

@end

@implementation WorkstationContentViewController

//@synthesize groupIndex = _groupIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"bouncingBallExample" withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data1];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(20.0, 89.0, 280.0, 199.0);
    
    [self.view addSubview:imageView];
    
    
    // Do not change width! This ensures 20px on both ends.
    CGRect labelFrame = CGRectMake(20, 296, 280, 233);
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [descriptionLabel setBackgroundColor:[UIColor orangeColor]];
    
    [descriptionLabel setText:@"a a a a a a a a a a a a a a a a aiii a a a a a a a a a"];
    
    [descriptionLabel setFont:[UIFont fontWithName:kRobotoRegular size:18]];
    
    // Tell the label to use an unlimited number of lines
    [descriptionLabel setNumberOfLines:0];
    [descriptionLabel sizeToFit];
    
    
    [self.view addSubview:descriptionLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextGroup:(id)sender
{
    [appDelegate incGroupIndex];
    NSLog(@"groupIndex: %d", [appDelegate getGroupIndex]);
}


@end
