//
//  ViewNotesController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAdd.h"
#import "AppDelegate.h"

@interface ViewNotesController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *subjectTitle;
@property (nonatomic, strong) IBOutlet UITextView *viewNote;
@property (nonatomic, strong) IBOutlet UIButton *editNote;
-(IBAction)updateNote:(id)sender;

@property (nonatomic, strong) NSString *stringSubject;
@property (nonatomic, strong) NSString *stringNote;
@property int position;


@end
