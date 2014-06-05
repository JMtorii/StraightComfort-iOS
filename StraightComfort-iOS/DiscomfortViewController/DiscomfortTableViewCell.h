//
//  DiscomfortTableViewCell.h
//  StraightComfort-iOS
//
//  Created by Mark Torii on 5/31/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscomfortTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *discomfortTitle;
@property (nonatomic, weak) IBOutlet UISwitch *discomfortSwitch;

@end
