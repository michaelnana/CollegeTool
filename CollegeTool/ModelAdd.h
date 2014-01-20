//
//  ModelAdd.h
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelAdd : NSObject

-(void)saver:(NSString *)subject noteText:(NSString *)note;
-(void) updater:(NSString *)subject noteText:(NSString *)note notePosition:(int)position;

@end
