//
//  NewNoteViewController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "NewNoteViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ModelAdd.h"

@implementation NewNoteViewController
@synthesize writeNote;
@synthesize writeSubject;
@synthesize saveNote;
NSUserDefaults *prefs;
NSMutableArray *subjects;
NSMutableArray *notes;

AppDelegate *appDelegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[writeNote.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5]CGColor]];
        //[writeNote.layer setBorderWidth:2.0];

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
    [writeNote.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5]CGColor]];
    [writeNote.layer setBorderWidth:2.0];
    prefs=[NSUserDefaults standardUserDefaults];
    subjects=[[NSMutableArray alloc]init];
    notes=[[NSMutableArray alloc]init];
    
    appDelegate=[[UIApplication sharedApplication]delegate];
    
    
}

-(IBAction)save{
  
    //[addNote saver:writeSubject.text noteText:writeNote.text];
    [appDelegate.addNote saver:writeSubject.text noteText:writeNote.text];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [writeNote resignFirstResponder];
}
- (IBAction)dismissKeyboard:(id)sender
{
    [writeNote becomeFirstResponder];
    [writeNote resignFirstResponder];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)viewWillAppear:(BOOL)animated{
    //[writeNote setReturnKeyType:UIReturnKeyDone];
    writeNote.delegate = self;
}

@end
