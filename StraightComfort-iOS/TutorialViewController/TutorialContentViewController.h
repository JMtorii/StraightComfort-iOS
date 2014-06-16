//
//  TutorialContentViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/15/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
