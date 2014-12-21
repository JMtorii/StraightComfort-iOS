//
//  TutorialContentViewController.m
//  StraightComfort
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
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if (IS_IPAD) {
        NSString *fileName = [self.imageFile stringByAppendingString:@"-iPad"];
        self.backgroundImageView.image = [UIImage imageNamed:fileName];
    } else {
        self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];

    }
        
    self.titleLabel.text = self.titleLabelText;
    self.titleLabel.font = (IS_IPHONE) ? [UIFont fontWithName:kRobotoMedium size:19] : [UIFont fontWithName:kRobotoMedium size:30];
    
    CGRect labelFrame;
    if (IS_IPHONE_5) {
        labelFrame = CGRectMake(20, 425, 290, 50);
    } else if (!IS_IPHONE_5 && IS_IPHONE) {
        labelFrame = CGRectMake(20, 335, 290, 50);
    } else {
        labelFrame = CGRectMake(60, 760, 660, 233);
    }
    _curDescLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [_curDescLabel setText:_curDescText];
    [_curDescLabel setTextColor:[UIColor whiteColor]];
    if (IS_IPHONE) {
        [_curDescLabel setFont:[UIFont fontWithName:kRobotoRegular size:16]];
    } else {
        [_curDescLabel setFont:[UIFont fontWithName:kRobotoRegular size:26]];
    }
    
    // Tell the label to use an unlimited number of lines
    [_curDescLabel setNumberOfLines:0];
    [_curDescLabel sizeToFit];
    
    [self.view addSubview:_curDescLabel];
    
    if (IS_IPHONE) {
        [self.startButton.titleLabel setFont:[UIFont fontWithName:kRobotoBold size:16]];
    } else {
        [self.startButton.titleLabel setFont:[UIFont fontWithName:kRobotoBold size:26]];
    }
    
    if (self.isButtonVisible) {
        self.startButton.enabled = true;
        self.startButton.hidden = false;
    } else {
        self.startButton.enabled = false;
        self.startButton.hidden = true;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender
{
    [appDelegate goToMainViewController];
}

@end
