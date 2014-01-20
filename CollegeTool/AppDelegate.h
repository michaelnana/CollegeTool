//
//  AppDelegate.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-25.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelAdd.h"
#import "ModelAddNote.h"
#import "ModelRemind.h"
#import "ModelNotes.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)ModelAddNote *adder;
@property (nonatomic, strong)ModelRemind *remind;
@property (nonatomic, strong)ModelNotes *noters;
@property (nonatomic, strong)ModelAdd *altAddNote;
@property (nonatomic, strong)ModelAdd *addNote;
-(ModelAddNote *)newModelAddNote;
-(ModelRemind *)newModelRemind;
-(ModelNotes *)newModelNotes;
-(ModelAdd *)newModelAdd;
-(ModelAdd *)altModelAdd;


@end
