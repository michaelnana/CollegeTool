//
//  MainViewController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-09-16.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "RemindViewCell.h"
#import "ModelRemind.h"

@implementation MainViewController
@synthesize atableView;

NSUserDefaults *prefs;

UILabel *aLabel;
AppDelegate *appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    prefs=[NSUserDefaults standardUserDefaults];
    //[tableView reloadData];
    
    
    CGRect screenSize=[[UIScreen mainScreen]bounds];
    CGFloat screenWidth=screenSize.size.width;
    CGFloat screenHeight=screenSize.size.height;
    
    //if([[remind]])
    aLabel=[[UILabel alloc]initWithFrame:CGRectMake((screenWidth/2)-100,(screenHeight/2)-100, 1000, 20)];
    [aLabel setBackgroundColor:[UIColor clearColor]];
    [aLabel setText:@"Add yourself a reminder"];
    appDelegate=[[UIApplication sharedApplication]delegate];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [[self view]addSubview:aLabel];
    [atableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier=@"RemindViewCell";
     RemindViewCell *cell=(RemindViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        //cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"RemindViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
   
    [aLabel removeFromSuperview];
    cell.remind.text=[appDelegate.remind remindText:indexPath];//[reminder remindText:indexPath];//[[prefs stringArrayForKey:@"Subjects"] objectAtIndex:indexPath.row];
    //NSLog(@"The date of this is %@",[[prefs stringArrayForKey:@"reminders"] objectAtIndex:indexPath.row]);
    
    cell.remindTime.text=[appDelegate.remind remindDate:indexPath];//[reminder remindDate:indexPath];//[[prefs stringArrayForKey:@"reminders"] objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return[[prefs stringArrayForKey:@"Subjects"] count];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Clicked on the delete button");
    /*NSMutableArray *yeah=[[NSMutableArray alloc]init];
    for(id object in [prefs stringArrayForKey:@"Subjects"]){
        [yeah addObject:object];
    }
    [yeah removeObjectAtIndex:indexPath.row];
    [prefs setObject:yeah forKey:@"Subjects"];*/
    //[reminder remindDelete:indexPath];
    [appDelegate.remind remindDelete:indexPath];
    [tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
