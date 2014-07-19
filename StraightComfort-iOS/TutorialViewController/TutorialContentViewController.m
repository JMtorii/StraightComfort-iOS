//
//  TutorialContentViewController.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/15/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "TutorialContentViewController.h"

@interface TutorialContentViewController ()

@end

@implementation TutorialContentViewController

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
    self.titleLabel.font = [UIFont fontWithName:kRobotoRegular size:20];
    
    // Do not change width! This ensures 20px on both ends.
    CGRect labelFrame = CGRectMake(20, 340, 280, 233);
    _curDescLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [_curDescLabel setText:_curDescText];
    [_curDescLabel setTextColor:[UIColor whiteColor]];
    [_curDescLabel setFont:[UIFont fontWithName:kRobotoRegular size:16]];
    
    // Tell the label to use an unlimited number of lines
    [_curDescLabel setNumberOfLines:0];
    [_curDescLabel sizeToFit];
    
    [self.view addSubview:_curDescLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
