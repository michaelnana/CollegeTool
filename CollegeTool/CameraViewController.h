//
//  CameraViewController.h
//  CollegeTool
//
//  Created by Michael Nana on 13-10-07.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *cameraImage;
-(IBAction)selectPicture:(id)sender;
-(IBAction)takePicture:(id)sender;


@end
