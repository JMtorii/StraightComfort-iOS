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
    self.titleLabel.text = self.titleText;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
