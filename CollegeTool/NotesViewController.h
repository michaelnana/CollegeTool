//
//  NotesViewController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>
#import "ModelNotes.h"
#import "AppDelegate.h"

@interface NotesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *atableView;


@end
