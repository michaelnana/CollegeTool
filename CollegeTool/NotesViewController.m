//
//  NotesViewController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-09-18.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "NotesViewController.h"
#import "ViewNotesController.h"
#import "ModelNotes.h"


@implementation NotesViewController
@synthesize atableView;
NSUserDefaults *prefs;

AppDelegate *appDelegate;
UILabel *altLabel;

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
    prefs =[NSUserDefaults standardUserDefaults];
    
    appDelegate=[[UIApplication sharedApplication]delegate];
    
    CGRect screenSize=[[UIScreen mainScreen]bounds];
    CGFloat screenWidth=screenSize.size.width;
    CGFloat screenHeight=screenSize.size.height;
    
    altLabel=[[UILabel alloc]initWithFrame:CGRectMake((screenWidth/2)-100,(screenHeight/2)-100, 1000, 20)];
    [altLabel setBackgroundColor:[UIColor clearColor]];
    [altLabel setText:@"Add yourself a note"];
    appDelegate=[[UIApplication sharedApplication]delegate];
}
- (void)viewWillAppear:(BOOL)animated {
    [[self view]addSubview:altLabel];
    [atableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier=@"SaveNotesCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [altLabel removeFromSuperview];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[appDelegate.noters noteText:indexPath];//[aNoter noteText:indexPath];//[[prefs stringArrayForKey:@"NoteSubjects"] objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return[[prefs stringArrayForKey:@"NoteSubjects"] count];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"viewNote"]){
        ViewNotesController *view =segue.destinationViewController;
        NSIndexPath *path=[self.atableView indexPathForSelectedRow];
        view.stringSubject=[[prefs stringArrayForKey:@"NoteSubjects"] objectAtIndex:path.row];
        view.stringNote=[[prefs stringArrayForKey:@"NotesText"] objectAtIndex:path.row];
        view.position=path.row;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Clicked on the delete button");
    
    //[aNoter noteDelete:indexPath];
    [appDelegate.noters noteDelete:indexPath];
    [tableView reloadData];
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
