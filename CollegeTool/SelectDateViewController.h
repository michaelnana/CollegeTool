//
//  SelectDateViewController.h
//  CollegeToolApp
//
//  Created by Michael Nana on 13-09-23.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNoteController.h"

@interface SelectDateViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIDatePicker *getDate;
@property (nonatomic, strong) NSDate  *theDate;
-(IBAction)cancel;
-(IBAction)saveDate:(id)sender;
@property (nonatomic, strong) AddNoteController *add;
-(void)setAddNoteController:(AddNoteController *)note;

@end
