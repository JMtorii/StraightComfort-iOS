//
//  WorkstationContentViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/21/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"
#import "WorkstationSetupViewController.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface WorkstationContentViewController : UIViewController {
//    int groupIndex;
    AppDelegate *appDelegate;
}

@property (weak, nonatomic) IBOutlet UIView *descriptionFrame;
@property (weak, nonatomic) IBOutlet UIView *animationFrame;
@property (strong, nonatomic) UILabel *descLabel;
@property NSUInteger pageIndex;

@property NSString *imageFile;

- (IBAction)nextGroup:(id)sender;

@end
