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
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    
    // Do not change width! This ensures 20px on both ends.
    CGRect labelFrame = CGRectMake(20, 310, 280, 150);
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [descriptionLabel setBackgroundColor:[UIColor orangeColor]];
    

    [descriptionLabel setText:@"a a a a a a a a a a a a a a a a aiii a a a a a a a a a"];
    
    [descriptionLabel setFont:[UIFont systemFontOfSize:20]];
    
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

@end
