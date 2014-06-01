//
//  DiscomfortTableViewCell.m
//  StraightComfort-iOS
//
//  Created by Mark Torii on 5/31/14.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "DiscomfortTableViewCell.h"

@implementation DiscomfortTableViewCell

@synthesize discomfortTitle = _discomfortTitle;
@synthesize discomfortSwitch = _discomfortSwitch;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
