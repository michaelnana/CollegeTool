//
//  ModelNotes.h
//  CollegeTool
//
//  Created by Michael Nana on 13-11-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelNotes : NSObject
-(NSString *)noteText:(NSIndexPath *)indexPath;
-(void)noteDelete:(NSIndexPath *)indexPath;

@end
