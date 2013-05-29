//
//  DVDNoteViewController.m
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDNoteViewController.h"
#import "DVDNoteModel.h"
#import "DVDNotebookModel.h"
#import "DVDSNoteViewController.h"

@interface DVDNoteViewController ()

@property (strong, nonatomic) DVDNotebookModel *noteBoook;

@end



@implementation DVDNoteViewController



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

#pragma mark - table data source
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //averiguar la nota
    DVDNoteModel *note =[self.fetchedResultsController objectAtIndexPath:indexPath];
    //crear un id de celda
    static NSString *cellID = @"cellID";
    //si no existe crearla
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //pedir la celda de la tabla
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellID ];
    }
    //configurar la celda
    cell.imageView.image = note.photo;
    cell.textLabel.text = note.name;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.timeStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [format stringFromDate:note.dateModified];

    //devolverla
    return cell;
}

-(id)initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                style:(UITableViewStyle)aStyle
                             notebook:(DVDNotebookModel *) aNotebook{
    if (self = [super initWithFetchedResultsController:aFetchedResultsController
                                                 style:aStyle]){
        _noteBoook = aNotebook;
        self.title = aNotebook.name;
    }
    return self;
}


#pragma mark -table view delegate
-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //averiguar la nota
    DVDNoteModel *note = [self.fetchedResultsController objectAtIndexPath:indexPath ];
    
    //crear un single notevc
    DVDSNoteViewController *snVC = [[DVDSNoteViewController alloc] initWithModel:note];
    
    //hacer un push
    [self.navigationController pushViewController:snVC animated:YES];

}

@end
