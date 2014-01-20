//
//  MainViewController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-09-16.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelRemind.h"
#import "AppDelegate.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *atableView;



@end
