//
//  AddNoteController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-16.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ModelAddNote.h"
#import "AppDelegate.h"

@interface AddNoteController : UIViewController <EKEventEditViewDelegate>
@property (nonatomic, strong) IBOutlet UIButton *addNote;
@property (nonatomic, strong) IBOutlet UITextField *writeNote;
@property (nonatomic, strong) NSMutableArray *notesSubject;
@property (nonatomic, strong) NSDate *setDate;
@property (nonatomic, unsafe_unretained) id delegate;


-(IBAction)saveNote;
-(IBAction)showPopOver:(id)sender;
-(void)setNotification;


@end
