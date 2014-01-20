//
//  NewNoteViewController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewNoteViewController : UIViewController <UITextViewDelegate>
@property (nonatomic, strong) IBOutlet UIButton *saveNote;
@property (nonatomic, strong) IBOutlet UITextField *writeSubject;
@property (nonatomic, strong) IBOutlet UITextView  *writeNote;

-(IBAction)save;
- (IBAction)dismissKeyboard:(id)sender;


@end
