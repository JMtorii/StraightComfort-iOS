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
    
    if (appDelegate.groupIndex == 0 && self.pageIndex == 0) {
        self.mainTitle.text = @"Let's improve your workstation!";
        self.mainTitle.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        self.mainTitle.font = [UIFont fontWithName:kRobotoThin size:28];
        
        self.desc.text = @"Swipe left";
        
        self.desc.font = (IS_IPHONE) ? [UIFont fontWithName:kRobotoRegular size:18] : [UIFont fontWithName:kRobotoRegular size:25];
        
        if (IS_IPHONE_5) {
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"finger" withExtension:@"gif"];
            NSData *data1 = [NSData dataWithContentsOfURL:url];
            FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data1];
            FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
            imageView.animatedImage = image;
            imageView.frame = CGRectMake(20.0, 330.0, 280.0, 199.0);
            [self.view addSubview:imageView];
        }
        
        [self.nextButton setHidden:true];
                
    } else if (appDelegate.groupIndex != appDelegate.maxGroupIndex){
        self.mainTitle.text = @"Yay!";
        self.mainTitle.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        
        self.desc.text = @"We just made your workstation a bit better :)";
        
        [self.nextButton setHidden:false];
        [self.nextButton setTitle:@"Make life better" forState:UIControlStateNormal];
        
        if (IS_IPHONE) {
            self.mainTitle.font = [UIFont fontWithName:kRobotoThin size:28];
            self.desc.font = [UIFont fontWithName:kRobotoRegular size:16];
            self.nextButton.titleLabel.font = [UIFont fontWithName:kRobotoRegular size:22];
            
        } else {
            self.mainTitle.font = [UIFont fontWithName:kRobotoThin size:56];
            self.desc.font = [UIFont fontWithName:kRobotoRegular size:32];
            self.nextButton.titleLabel.font = [UIFont fontWithName:kRobotoRegular size:44];
            
        }
                
    } else {
        self.mainTitle.text = @"Life's a lot better now! :)";
        self.mainTitle.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        
        [self.desc setHidden:true];
        
        [self.nextButton setHidden:false];
        [self.nextButton setTitle:@"Return home" forState:UIControlStateNormal];
        
        if (IS_IPHONE) {
            self.mainTitle.font = [UIFont fontWithName:kRobotoThin size:28];
            self.nextButton.titleLabel.font = [UIFont fontWithName:kRobotoRegular size:22];
            
        } else {
            self.mainTitle.font = [UIFont fontWithName:kRobotoThin size:56];
            self.nextButton.titleLabel.font = [UIFont fontWithName:kRobotoRegular size:44];
            
        }
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    appDelegate.groupIndex++;
    
    if (appDelegate.groupIndex <= appDelegate.maxGroupIndex) {
        NSLog(@"%d", appDelegate.groupIndex);
        NSString *storyboardName = (IS_IPHONE) ? @"WorkstationSetupViewController_iPhone" : @"WorkstationSetupViewController_iPad";
        UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
        UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"WorkstationSetupViewController"];
        [[self navigationController] pushViewController:viewController animated:YES];
        
    } else {
        for (UIViewController *controller in self.navigationController.viewControllers) {
                
            if ([controller isKindOfClass:[MainViewController class]]) { 

                [self.navigationController popToViewController:controller animated:YES];
                break;
            }
        }
    }
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
