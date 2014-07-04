//
//  WorkstationIntroEndViewController.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 7/2/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationIntroEndViewController.h"


@implementation WorkstationIntroEndViewController

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
    
    self.desc.text = @"Let's work to improve your workstation!";
    [self.desc setFont:[UIFont fontWithName:kRobotoRegular size:18]];
        
    (self.pageIndex > 0) ? [self.nextButton setHidden:false] : [self.nextButton setHidden:true];
    
    if (self.pageIndex > 0) {
        [self.nextButton setHidden:false];
        [self.swipeLabel setHidden:true];
        
    } else {
        [self.nextButton setHidden:true];
        [self.swipeLabel setHidden:false];
        
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
//    [appDelegate incGroupIndex];
    appDelegate.groupIndex++;
    NSLog(@"%d", appDelegate.groupIndex);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
