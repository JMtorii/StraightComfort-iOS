//
//  WorkstationIntroEndViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 7/2/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface WorkstationIntroEndViewController : UIViewController {
    AppDelegate *appDelegate;
}

@property NSUInteger pageIndex;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)next:(id)sender;


@end
