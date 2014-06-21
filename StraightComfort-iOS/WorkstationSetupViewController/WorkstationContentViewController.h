//
//  WorkstationContentViewController.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 6/21/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkstationContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property NSUInteger pageIndex;

@property NSString *imageFile;

@end
