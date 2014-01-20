//
//  CameraViewController.m
//  CollegeTool
//
//  Created by Michael Nana on 13-10-07.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation CameraViewController
@synthesize cameraImage;


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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor redColor];
    cameraImage.layer.borderWidth=5.0f;
    cameraImage.layer.borderColor=[[UIColor grayColor]CGColor];
    
    /*if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"No Camera" message:@"You do not have a camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }*/
    
}

-(IBAction)takePicture:(id)sender{
    UIImagePickerController *takePicture =[[UIImagePickerController alloc]init];
    takePicture.delegate=self;
    takePicture.allowsEditing=YES;
    takePicture.sourceType=UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:takePicture animated:YES completion:NULL];
}

-(IBAction)selectPicture:(id)sender{
    UIImagePickerController *getPicture=[[UIImagePickerController alloc]init];
    getPicture.delegate=self;
    getPicture.allowsEditing=YES;
    getPicture.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:getPicture animated:YES completion:NULL];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    UIImage *chosen=image;
    cameraImage.image=chosen;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"No Camera" message:@"You do not have a camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
