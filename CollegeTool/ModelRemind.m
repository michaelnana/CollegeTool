//
//  ModelRemind.m
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ModelRemind.h"

@implementation ModelRemind
NSUserDefaults *prefs;
NSString *text;
NSString *date;

-(NSString *)remindText:(NSIndexPath *)indexPath{
    //NSLog(@"Hello");
    prefs=[NSUserDefaults standardUserDefaults];
    text=[[prefs stringArrayForKey:@"Subjects"] objectAtIndex:indexPath.row];
    return text;
}

-(NSString *)remindDate:(NSIndexPath *)indexPath{
    prefs=[NSUserDefaults standardUserDefaults];
    NSLog(@"The indexpath is %d",indexPath.row);
    NSLog(@"This array is %d",[[prefs stringArrayForKey:@"reminders"] count]);
    
    if([[[prefs stringArrayForKey:@"reminders"] objectAtIndex:indexPath.row] isEqualToString:@"null"]){
        return @"";
    }else{
    date=[[prefs stringArrayForKey:@"reminders"] objectAtIndex:indexPath.row];
    return date;
    }
}

-(void)remindDelete:(NSIndexPath *)indexPath{
    NSMutableArray *yeah=[[NSMutableArray alloc]init];
    for(id object in [prefs stringArrayForKey:@"Subjects"]){
        [yeah addObject:object];
    }
    [yeah removeObjectAtIndex:indexPath.row];
    [prefs setObject:yeah forKey:@"Subjects"];
}
@end
