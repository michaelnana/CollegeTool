//
//  SelectDateViewController.m
//  CollegeToolApp
//
//  Created by Michael Nana on 13-09-23.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SelectDateViewController.h"
#import "AddNoteController.h"

@implementation SelectDateViewController
@synthesize getDate;
@synthesize theDate;
@synthesize add;
AddNoteController *setNote;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //modalViewController.delegate = self;
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)cancel{
    //[self.parentViewController dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setParentController:(UIViewController*)parent{
    [self setValue:parent forKey:@"_parentViewController"];
}
-(IBAction)saveDate:(id)sender{
    NSDate *pickerDate=[self.getDate date];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Reminder" message:@"Reminder time set" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
    //NSUInteger numberOfViewControllersOnStack = [self.navigationController.viewControllers count];
    
    
    setNote.setDate=pickerDate;
    [setNote setNotification];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self dismissModalPushControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)setAddNoteController:(AddNoteController *)note{
    setNote=note;
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

@end
