//
//  WorkstationContentViewController.m
//  StraightComfort
//
//  Created by Mark Torii on 6/21/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationContentViewController.h"

@implementation WorkstationContentViewController

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
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:self.imageName withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data1];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    
    if (IS_IPHONE_6) {
        imageView.frame = CGRectMake(20.0, 99.0, 330.0, 270.0);
    } else if (IS_IPHONE_6P) {
        // MODIFY
        imageView.frame = CGRectMake(20.0, 89.0, 280.0, 220.0);
    } else if (IS_IPHONE_5) {
        imageView.frame = CGRectMake(20.0, 89.0, 280.0, 220.0);
    } else if (!IS_IPHONE_5 && !IS_IPHONE_6 && !IS_IPHONE_6P && IS_IPHONE) {
        imageView.frame = CGRectMake(40.0, 79.0, 240.0, 180.0);
    } else {
        imageView.frame = CGRectMake(100.0, 130.0, 580.0, 520.0);
    }
    
    [self.view addSubview:imageView];
    
    
    // Do not change width! This ensures 20px on both ends.
    CGRect labelFrame;
    
    if (IS_IPHONE_6) {
        labelFrame = CGRectMake(20, 465, 335, 250);
    } else if (IS_IPHONE_6P) {
        // MODIFY
        labelFrame = CGRectMake(20, 360, 280, 233);
    } else if (IS_IPHONE_5) {
        labelFrame = CGRectMake(20, 360, 280, 233);
    } else if (!IS_IPHONE_5 && !IS_IPHONE_6 && !IS_IPHONE_6P && IS_IPHONE) {
        labelFrame = CGRectMake(20, 280, 280, 233);
    } else {
        labelFrame = CGRectMake(60, 720, 660, 233);
    }
    
    _descLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [_descLabel setText:_descText];
    [_descLabel setTextColor:[UIColor whiteColor]];
    
    if (IS_IPHONE_6 || IS_IPHONE_6P) {
        [_descLabel setFont:[UIFont fontWithName:kRobotoRegular size:17]];
    } else if (IS_IPHONE) {
        [_descLabel setFont:[UIFont fontWithName:kRobotoRegular size:16]];
    } else {
        [_descLabel setFont:[UIFont fontWithName:kRobotoRegular size:28]];
    }
    
    // Tell the label to use an unlimited number of lines
    [_descLabel setNumberOfLines:0];
    [_descLabel sizeToFit];
    
    [self.view addSubview:_descLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
