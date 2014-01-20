//
//  RemindViewCell.m
//  CollegeTool
//
//  Created by Michael Nana on 13-10-02.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "RemindViewCell.h"

@implementation RemindViewCell
@synthesize remind;
@synthesize remindTime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
