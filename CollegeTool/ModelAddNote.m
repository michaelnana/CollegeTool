//
//  ModelAddNote.m
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ModelAddNote.h"

@implementation ModelAddNote
NSMutableArray *newSubjects;
NSMutableArray *beforeSubjects;
NSUserDefaults *prefs;
NSMutableArray *dateReminds;
NSMutableArray *dateTime;
NSString *setDateTime;
NSString *setDateTime2;

-(void)saverNote:(NSDate *)theDate noteText:(NSString *)text{
    prefs=[NSUserDefaults standardUserDefaults];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init] ;
    //[dateFormatter setDateStyle:NSDateFormatterLongStyle];
    //[dateFormatter setTimeStyle:@"h:mm"];//NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"d MMM yyyy h:mm: a"];
    if([[prefs stringArrayForKey:@"Subjects"] count]==0){
        NSLog(@"Went through here 1");
        beforeSubjects=[[NSMutableArray alloc]init];
        dateReminds=[[NSMutableArray alloc]init];
        //NSLog(@"The date set is %@",setDate);
        if(theDate!=NULL){
        setDateTime=[dateFormatter stringFromDate:theDate];//[NSDateFormatter localizedStringFromDate:theDate 
                                                   //dateStyle:NSDateFormatterShortStyle 
                                                   //timeStyle:NSDateFormatterFullStyle];
        [dateReminds addObject:setDateTime];
        }else{
            [dateReminds addObject:@"null"];
        }
        for(id object in dateReminds){
            NSLog(@"The dates included date time are %@",object);
        }
        [beforeSubjects addObject:text];
        [prefs setObject:beforeSubjects forKey:@"Subjects"];
        [prefs synchronize];
        [prefs setObject:dateReminds forKey:@"reminders"];
        [prefs synchronize];
        for(id object in [prefs stringArrayForKey:@"reminders"]){
            NSLog(@"The dates included are %@",object);
        }
        NSLog(@"The length of the array is %d",[beforeSubjects count]);
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note was saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //[notesView.tableView reloadData];
        
    }
    //If not empty, get the array stored in the user defaults and set it to a temp array, add text to that temp array and then place the temp array back to the user defaults.
    else{
        NSLog(@"Went through here 2");
        //NSLog(@"The date set is %@",setDate);
        prefs=[NSUserDefaults standardUserDefaults];
        newSubjects=[[NSMutableArray alloc]init];
        dateTime=[[NSMutableArray alloc]init];
        for(id object in [prefs stringArrayForKey:@"Subjects"]){
            [newSubjects addObject:object];
        }
        for(id object in [prefs stringArrayForKey:@"reminders"]){
            [dateTime addObject:object];
        }
        //newSubjects= [prefs stringArrayForKey:@"Subjects"];
        [newSubjects addObject:text];
        if(theDate!=NULL){
        setDateTime2=[dateFormatter stringFromDate:theDate];
        [dateTime addObject:setDateTime2];
        }else{
            [dateTime addObject:@"null"];
        }
        for(id object in dateTime){
            NSLog(@"The dates included date time are %@",object);
        }
        [prefs setObject:newSubjects forKey:@"Subjects"];
        [prefs synchronize];
        [prefs setObject:dateTime forKey:@"reminders"];
        [prefs synchronize];
        for(id object in [prefs stringArrayForKey:@"reminders"]){
            NSLog(@"The dates included are %@",object);
        }
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note was saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //[notesView.tableView reloadData];
    }
    

}

@end
