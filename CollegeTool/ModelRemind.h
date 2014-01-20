//
//  ModelRemind.h
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelRemind : NSObject

-(NSString *)remindText:(NSIndexPath *)indexPath;
-(NSString *)remindDate:(NSIndexPath *)indexPath;
-(void)remindDelete:(NSIndexPath *)indexPath;

@end
