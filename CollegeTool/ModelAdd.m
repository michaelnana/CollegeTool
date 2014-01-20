//
//  ModelAdd.m
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ModelAdd.h"

@implementation ModelAdd
NSUserDefaults *prefs;
NSMutableArray *subjects;
NSMutableArray *notes;

-(void) saver:(NSString *)subject noteText:(NSString *)note{
    prefs=[NSUserDefaults standardUserDefaults];
    subjects=[[NSMutableArray alloc]init];
    notes=[[NSMutableArray alloc]init];
    if([[prefs stringArrayForKey:@"NoteSubjects"] count]==0){
        [subjects addObject:subject];
        [prefs setObject:subjects forKey:@"NoteSubjects"];
        [notes addObject:note];
        [prefs setObject:notes forKey:@"NotesText"];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        for(id object in [prefs stringArrayForKey:@"NoteSubjects"])
        {
            [subjects addObject:object];
            
        }
        for(id object in [prefs stringArrayForKey:@"NotesText"])
        {
            [notes addObject:object];
            
        }
        
        [subjects addObject:subject];
        [prefs setObject:subjects forKey:@"NoteSubjects"];
        [notes addObject:note];
        [prefs setObject:notes forKey:@"NotesText"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

}

-(void) updater:(NSString *)subject noteText:(NSString *)note notePosition:(int)position{
    prefs=[NSUserDefaults standardUserDefaults];
    subjects=[[NSMutableArray alloc]init];
    notes=[[NSMutableArray alloc]init];
  /*  if([[prefs stringArrayForKey:@"NoteSubjects"] count]==0){
        [subjects addObject:subject];
        [prefs setObject:subjects forKey:@"NoteSubjects"];
        [notes addObject:note];
        [prefs setObject:notes forKey:@"NotesText"];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{*/
        for(id object in [prefs stringArrayForKey:@"NoteSubjects"])
        {
            [subjects addObject:object];
            
        }
        for(id object in [prefs stringArrayForKey:@"NotesText"])
        {
            [notes addObject:object];
            
        }
        [subjects replaceObjectAtIndex:position withObject:subject];
        //[subjects addObject:subject];
        [prefs setObject:subjects forKey:@"NoteSubjects"];
        [notes replaceObjectAtIndex:position withObject:note];
        [prefs setObject:notes forKey:@"NotesText"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Note Saved" message:@"Your note has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    //}
    
}

@end
