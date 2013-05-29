//
//  DVDNotebookViewController.m
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDNotebookViewController.h"
#import "DVDNotebookModel.h"
#import "DVDNoteViewController.h"
#import "DVDNoteModel.h"

@interface DVDNotebookViewController ()

@end

@implementation DVDNotebookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoSave];
    self.title = @"EverPobre";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source Messages

-(UITableViewCell*) tableView: (UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //averiguar el notebook que nos piden
    DVDNotebookModel *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear un id de celda
    static NSString *cellID = @"cellID";
    
    //pedirle a la tabla una celda que tenga disponible, a mano
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //sino tiene ninguna crearla
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //configurarla: sincronizar las celdas con el notebook
    cell.textLabel.text =nb.name;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.timeStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [dateFormat stringFromDate:nb.dateModified];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //devolverla
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // averiguar cual es la libreta en la que clickeo
    DVDNotebookModel *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creamos un nsfetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[DVDNoteModel entityName]];
    
    request.sortDescriptors = @[
                              [NSSortDescriptor sortDescriptorWithKey:@"dateModified" ascending:NO],
                              [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]
                              
                              ];
    
    // creamos el select by para filtrar solo las notas que pertenecen a esta libreta
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self.notebook = %@",nb];
    request.predicate = filter;
    
    // sacamos los dtos
    NSFetchedResultsController *fetchVC = [[NSFetchedResultsController alloc]initWithFetchRequest:request
                                                                           managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil];
    
    
    
    // crear un noteVc
    DVDNoteViewController *notes = [[DVDNoteViewController alloc] initWithFetchedResultsController:fetchVC
                                                                                             style:UITableViewStylePlain
                                                                                          notebook:nb];
    
    // hacer un push
    [self.navigationController pushViewController:notes
                                         animated:YES];
    
    
}

#pragma mark - autosave
-(void)autoSave {
    NSLog(@"GUARDO\n");
    if(AUTO_SAVE){
        NSError *err = nil;
        BOOL rc = NO;
    
        if(self.fetchedResultsController.managedObjectContext.hasChanges){
            rc = [self.fetchedResultsController.managedObjectContext save:&err];
        }
    
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY];
    }
}

//UI managed Document
@end
