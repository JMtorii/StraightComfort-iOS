//
//  TutorialContentViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/15/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface TutorialContentViewController : UIViewController {
    AppDelegate *appDelegate;
}

@property (weak, nonatomic) IBOutlet UIView *descriptionFrame;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) NSString *titleLabelText;
@property (strong, nonatomic) NSString *curDescText;
@property (strong, nonatomic) UILabel *curDescLabel;
@property NSUInteger pageIndex;
@property NSString *imageFile;
@property BOOL isButtonVisible;

- (IBAction)start:(id)sender;

@end
