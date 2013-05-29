//
//  DVDPhotoViewController.m
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDPhotoViewController.h"
#import "DVDNoteModel.h"

@interface DVDPhotoViewController ()

@end

@implementation DVDPhotoViewController
//Al cargar sube la foto, al desmostrarse la devuelve
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.photo.image = self.model.photo;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.model.photo = self.photo.image;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trash:(id)sender {
    //sacarla del modelo
    self.model.photo = nil;
    //sacarla de la vista
    //animarlo para que se vea play
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}

- (IBAction)takePhoto:(id)sender {
    //crear una instancia del image picker
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    //configuramos
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //si tiene usamos la camara, sino el carrete
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    //coloco a si mismo como delegado
    picker.delegate = self;
    
    //esto muestra el picker
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    
    
}

-(id) initWithModel: (DVDNoteModel *) aModel{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = aModel;
    }
    return self;
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage  *photo = [info objectForKey: UIImagePickerControllerOriginalImage];
    self.model.photo = photo;
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
@end
