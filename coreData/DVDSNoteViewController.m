//
//  DVDSNoteViewController.m
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDSNoteViewController.h"
#import "DVDNoteModel.h"
#import "DVDPhotoViewController.h"

@interface DVDSNoteViewController ()

@end

@implementation DVDSNoteViewController

-(id) initWithModel: (DVDNoteModel *) aModel{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = aModel;
        self.title = @"Note";
    }
    return self;
}

#pragma mark - View life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //asignar delegados
    
    self.nameView.delegate = self;
    self.contentView.delegate = self;
    
    //sincronizar vista con modelo
    self.nameView.text = self.model.name;
    self.contentView.text = self.model.content;
    
    //modificar la text view
    self.contentView.layer.borderWidth = 2.0;
    self.contentView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.contentView.layer.cornerRadius = 10;
    self.contentView.clipsToBounds = YES;
    
    //darse de alta en notificaciones del teclado
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(keyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    [nc addObserver:self
           selector:@selector(keyboardWillDissappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
    
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.model.content = self.contentView.text;
    self.model.name = self.nameView.text;
    //darse de baja en notificaciones del teclado
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //removeobserver self lo quita de todas todas las notificaciones
    [nc removeObserver:self];
}

#pragma marks - Notification methods
-(void)keyboardWillAppear:(NSNotification *) aNotification{
    //extraemos los datos de la notificacion
    double duration = [[aNotification.userInfo objectForKey:
                          UIKeyboardAnimationDurationUserInfoKey ] doubleValue];
    CGRect frame = [[aNotification.userInfo objectForKey:
                     UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    //calculamos el nuevo tamanoo
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height - frame.size.height;
    
    CGRect finalBounds = CGRectMake(20, 84, width, height);
    
    //aninamos el cambio
    [UIView animateWithDuration: duration
                     animations: ^{
                         self.contentView.frame = finalBounds;
                     }
                     completion:nil
     ];
}
-(void)keyboardWillDissappear:(NSNotification *) aNotification{
    //extraemos los datos de la notificacion
    double duration = [[aNotification.userInfo objectForKey:
                        UIKeyboardAnimationDurationUserInfoKey ] doubleValue];
    CGRect frame = [[aNotification.userInfo objectForKey:
                     UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    //calculamos el nuevo tamanoo
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height + frame.size.height;
    
    CGRect finalBounds = CGRectMake(20, 84, width, height);
    
    //aninamos el cambio
    [UIView animateWithDuration: duration
                     animations: ^{
                         self.contentView.frame = finalBounds;
                     }
                     completion:nil
     ];
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


#pragma mark - uitextfielddelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    //aca podemos validar lo que el usuario haya escrito
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Remove Keyboard
-(IBAction)removeKeyboard:(id)sender {
    // obligo a que todas las subvistas suelten el teclado sea quein quien sea que lo tenga agarrao
    [self.view endEditing:YES];
    
}


- (IBAction)showPhoto:(id)sender {
    DVDPhotoViewController *photoVC = [[DVDPhotoViewController alloc] initWithModel:self.model];
    [self.navigationController pushViewController:photoVC
                                         animated:YES];
    
    
}
@end
