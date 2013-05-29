#import "DVDNotebookModel.h"


@interface DVDNotebookModel ()

// Private interface goes here.

@end


@implementation DVDNotebookModel

#pragma mark - Properties
-(NSString *)age{
    //Esto vale una cerveza
    return @"0";
}


#pragma  mark - Initialization  functions

-(void) awakeFromInsert {
    [super awakeFromInsert];
    //se activa cada vez que crean un record
    [self setupKVO];
}
-(void)awakeFromFetch {
    //se activa cada vez que retrieval data from the thingie
    [super awakeFromFetch];
    [self setupKVO];
}
-(void)willTurnIntoFault {
    //este es invocado cada vez que el objeto esta a punto de ser destruido
    [super willTurnIntoFault];
    [self tearDownKVO];
}


// Custom logic goes here.
+(id) notebookInContext: (NSManagedObjectContext *)aContext{
    
    //un objeto con valores por defecto
    DVDNotebookModel *nb = [self insertInManagedObjectContext:aContext];
    //colocamos las fechas default para que no dé error
    nb.dateCreated = [NSDate date];
    nb.dateModified = nb.dateCreated;

    return nb;
}


#pragma  mark - KVOs

-(void) setupKVO{
    //alta de las notificaciones
    //cada vez que cambie una propiedad queremos modificar otras
    [self addObserver:self
           forKeyPath:@"name"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];

}

-(void) tearDownKVO{
    //baja de las notificaciones
    [self removeObserver:self
              forKeyPath:@"name"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    //actualizo el modification date
    self.dateModified = [NSDate date];
}

@end
