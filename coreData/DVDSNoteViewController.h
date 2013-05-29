//
//  DVDSNoteViewController.h
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DVDNoteModel;

@interface DVDSNoteViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

- (IBAction)showPhoto:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameView;
@property (weak, nonatomic) IBOutlet UITextView *contentView;

@property (strong,nonatomic) DVDNoteModel *model;

-(id) initWithModel: (DVDNoteModel *) aModel;

-(IBAction)removeKeyboard:(id)sender;

@end
