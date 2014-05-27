//
//  ShortcutTableViewCell.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-05-26.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "ShortcutTableViewCell.h"

@implementation ShortcutTableViewCell

@synthesize shorcutTitleLabel = _shortcutTitleLabel;
@synthesize thumbnailImageView = _thumbnailImageView;

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
