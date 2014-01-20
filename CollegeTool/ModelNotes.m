//
//  ModelNotes.m
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ModelNotes.h"

@implementation ModelNotes
NSUserDefaults *prefs;
NSString *text;


-(NSString *)noteText:(NSIndexPath *)indexPath{
    //NSLog(@"Hello");
    prefs=[NSUserDefaults standardUserDefaults];
    //text=@"Hey";
    text=[[prefs stringArrayForKey:@"NoteSubjects"] objectAtIndex:indexPath.row];
    return text;
}

-(void)noteDelete:(NSIndexPath *)indexPath{
    NSLog(@"About to delete");
    NSMutableArray *yeah=[[NSMutableArray alloc]init];
    NSMutableArray *ohYeah=[[NSMutableArray alloc]init];
    for(id object in [prefs stringArrayForKey:@"NoteSubjects"]){
        [yeah addObject:object];
    }
    for(id object in [prefs stringArrayForKey:@"NotesText"]){
        [ohYeah addObject:object];
    }
    [yeah removeObjectAtIndex:indexPath.row];
    [ohYeah removeObjectAtIndex:indexPath.row];
    [prefs setObject:yeah forKey:@"NoteSubjects"];
    [prefs setObject:ohYeah forKey:@"NotesText"];
}

@end
