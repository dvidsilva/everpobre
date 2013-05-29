//
//  DVDPhotoViewController.h
//  
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DVDNoteModel;

@interface DVDPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>



@property (weak, nonatomic) IBOutlet UIImageView *photo;
- (IBAction)trash:(id)sender;
- (IBAction)takePhoto:(id)sender;



@property (strong, nonatomic) DVDNoteModel *model;

-(id) initWithModel: (DVDNoteModel *) aModel;

@end
