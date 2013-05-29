//
//  DVDAppDelegate.m
//  coreData
//
//  Created by Dvid Silva on 5/9/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDAppDelegate.h"
#import "AGTCoreDataStack.h"
#import "DVDNotebookModel.h"
#import "DVDNoteModel.h"
#import "DVDNotebookViewController.h"
#import "UIViewController+Navigation.h"

@implementation DVDAppDelegate

-(void) trastearConDatos{
    /*
    DVDNotebookModel *nb = [DVDNotebookModel notebookInContext: self.model.context];
    DVDNotebookModel *nb2 = [DVDNotebookModel notebookInContext: self.model.context];
    DVDNotebookModel *nb3 = [DVDNotebookModel notebookInContext: self.model.context];
    DVDNotebookModel *nb33 = [DVDNotebookModel notebookInContext: self.model.context];
    
    DVDNoteModel *note = [DVDNoteModel noteInNotebook:nb
                                          withContext:self.model.context];
    
    DVDNoteModel *note1 = [DVDNoteModel noteInNotebook:nb2
                                          withContext:self.model.context];
    DVDNoteModel *note3 = [DVDNoteModel noteInNotebook:nb3
                                          withContext:self.model.context];
    DVDNoteModel *note2 = [DVDNoteModel noteInNotebook:nb
                                          withContext:self.model.context];
    
    //si lo creas con contexto nil, no va a guardarlo en la base de datos, sino que va a ser como efimero
    nb.name = @"Libreta bonita";
    nb2.name = @"Libreta  2";

    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[DVDNoteModel entityName] ];

    //    NSPredicate are the conditions
    request.sortDescriptors = @[
                                [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES],
                                [NSSortDescriptor sortDescriptorWithKey:@"dateCreated"
                                                              ascending:NO]
                                ];
    NSError *err = nil;
    NSArray *results = [self.model.context executeFetchRequest:request
                                                         error:&err];
    if(results ==nil){
        //error al buscar
        NSLog(@"error al buscar %@", err);
    }
    //NSLog(@"libretas: %@", results);
    
    [self.model saveWithErrorBlock:^(NSError *error){
        NSLog(@"Has cagadola : %@",error);
    }];
     */
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.model = [AGTCoreDataStack coreDataStackWithModelName:@"DataModel"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //[self trastearConDatos];

    
    //creamos un fetchResults controller para traer las libretas
    NSFetchRequest *Notebooks = [[NSFetchRequest alloc]initWithEntityName: [DVDNotebookModel entityName] ];
    
    Notebooks.sortDescriptors = @[
                                  [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                ascending:YES],
                                  [NSSortDescriptor sortDescriptorWithKey:@"dateModified"
                                                                ascending:NO]
                                  ];
    
        //section name key path hace que se agrupen y la tabla venga con titulos automaticos
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc] initWithFetchRequest: Notebooks
                                                                              managedObjectContext:  self.model.context
                                                                                sectionNameKeyPath: nil
                                                                                         cacheName:nil];
    
    //creamos un notebookviewcontroller para mostrarlas en tabla
    DVDNotebookViewController *nbVC = [[DVDNotebookViewController alloc] initWithFetchedResultsController:fetched style:UITableViewStylePlain];
    
    
    //lo metemos en un navigation // se pueden ańadir metodos a clases prexistentes
    self.window.rootViewController = [nbVC wrappedInNavigation];
    
    
    //lo mostramos
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
