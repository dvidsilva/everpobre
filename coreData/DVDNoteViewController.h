//
//  DVDNoteViewController.h
//  everPobre
//
//  Created by Dvid Silva on 5/10/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class DVDNotebookModel;

@interface DVDNoteViewController : AGTCoreDataTableViewController

-(id)initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                style:(UITableViewStyle)aStyle
                             notebook:(DVDNotebookModel *) aNotebook;
@end
