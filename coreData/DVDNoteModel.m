#import "DVDNoteModel.h"


@interface DVDNoteModel ()

// Private interface goes here.

@end


@implementation DVDNoteModel

// Custom logic goes here.
+(id) noteInNotebook:(DVDNotebookModel *)aNotebook
             withContext:(NSManagedObjectContext *) aContext{
    
    DVDNoteModel *note = [DVDNoteModel insertInManagedObjectContext:aContext];
    note.notebook = aNotebook;
    note.dateCreated = [NSDate date];
    note.dateModified = note.dateCreated;
    
    return note;
}

#pragma mark - setting KVOs

-(void) setupKVO {
    //we will update the datemodified whenever any other property is changed
    NSArray *keys = @[@"name", @"text",@"photo"];
    for (NSString *key in keys){
        [self addObserver:self
               forKeyPath: key
                  options: NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
    //done with a for
}

-(void) tearDownKVO {
    [@[@"name", @"text", @"photo"] enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop){
        [self removeObserver:self forKeyPath:obj];
    }];
    //done with blocks
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    self.dateModified = [NSDate date];
}

#pragma  mark -life Cycle
-(void) awakeFromInsert {
    [super awakeFromInsert];
    [self setupKVO];
}
-(void) awakeFromFetch {
    [super awakeFromFetch];
    [self setupKVO];
}
-(void) willTurnIntoFault {
    [super willTurnIntoFault];
    [self tearDownKVO];
}

@end
