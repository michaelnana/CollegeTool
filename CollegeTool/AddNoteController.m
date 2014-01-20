//
//  AddNoteController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-09-16.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AddNoteController.h"
#import "MainViewController.h"
#import "SelectDateViewController.h"
#import "ModelAddNote.h"
#import <EventKitUI/EventKitUI.h>

@implementation AddNoteController

@synthesize addNote;
@synthesize writeNote;
@synthesize notesSubject;
@synthesize setDate;
@synthesize delegate;
NSMutableArray *newSubjects;
NSMutableArray *beforeSubjects;
NSUserDefaults *prefs;
NSMutableArray *dateReminds;
NSMutableArray *dateTime;
NSString *setDateTime;
NSString *setDateTime2;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        prefs=[NSUserDefaults standardUserDefaults];
        
        //Initialize this array only once when the USer Defaults is empty
        
    }
    return self;
}

-(IBAction)saveNote{
    
    //[anAdder saverNote:setDate noteText:writeNote.text];
    AppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    [appDelegate.adder saverNote:setDate noteText:writeNote.text];
    
}


-(IBAction)showPopOver:(id)sender{
    

    
}
-(void)setNotification{
    UILocalNotification *localNotification=[[UILocalNotification alloc]init];
    localNotification.fireDate=setDate;
    localNotification.alertBody=writeNote.text;
    localNotification.alertAction=@"Show me the reminder";
    localNotification.timeZone=[NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber=[[UIApplication sharedApplication]applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    NSLog(@"Timer set for notification");
    
    
    EKEventStore *store = [[EKEventStore alloc] init];
    
   /* if([store respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // iOS 6
        [store requestAccessToEntityType:EKEntityTypeEvent
                              completion:^(BOOL granted, NSError *error) {
                                  if (granted)
                                  {
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          [self createEventAndPresentViewController:store];
                                      });
                                  }
                              }];
    } else
    {*/
        // iOS 5
       // [self createEventAndPresentViewController:store];
    //}
    EKEvent *event = [EKEvent eventWithEventStore:store];
    event.title = @"Event Title";
    event.startDate = setDate;//[NSDate date]; //today
    event.endDate = [event.startDate dateByAddingTimeInterval:60*60];  //set 1 hour meeting
    [event setCalendar:[store defaultCalendarForNewEvents]];
    NSError *err = nil;
    [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
    //NSString *savedEventId = event.eventIdentifier;  //this is so you can access this event later
}

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"setReminder"]){
        NSLog(@"Yeahhhhhh");
        SelectDateViewController *dateSelect=segue.destinationViewController;
        [dateSelect setAddNoteController:self];
    }
}
-(IBAction)setTime{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SelectDateViewController"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentModalViewController:vc animated:YES];
    //SelectDateViewController *setTime=[[SelectDateViewController alloc]init];
    //[self presentModalViewController:setTime animated:YES];
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
    //prefs=[NSUserDefaults standardUserDefaults];
    //modalViewController.delegate = self;
    
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

@end
