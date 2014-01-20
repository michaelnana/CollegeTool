//
//  ViewNotesController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewNotesController.h"
#import "ModelAdd.h"

@implementation ViewNotesController
@synthesize subjectTitle;
@synthesize viewNote;
@synthesize editNote;
@synthesize stringNote;
@synthesize stringSubject;
@synthesize position;

AppDelegate *appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=stringSubject;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    subjectTitle.text=stringSubject;
    viewNote.text=stringNote;
    self.navigationItem.title=stringSubject;
    
    appDelegate=[[UIApplication sharedApplication]delegate];
}

-(IBAction)updateNote:(id)sender{
    //[anAddNote updater:subjectTitle.text noteText:viewNote.text notePosition:position];
    [appDelegate.altAddNote updater:subjectTitle.text noteText:viewNote.text notePosition:position];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [viewNote resignFirstResponder];
}
- (IBAction)dismissKeyboard:(id)sender
{
    [viewNote becomeFirstResponder];
    [viewNote resignFirstResponder];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text {
    
    // Any new character added is passed in as the "text" parameter
    
    if([text isEqualToString:@"\n"]) {
        
        // Be sure to test for equality using the "isEqualToString" message
        
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        
        return NO;
    }
    
    NSLog(@"Return button was not clicked");
    // For any other character return TRUE so that the text gets added to the view
    
    return YES;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    viewNote.delegate = self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
