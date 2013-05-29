#import "_DVDNotebookModel.h"

@interface DVDNotebookModel : _DVDNotebookModel {}
// Custom logic goes here.
+(id) notebookInContext: (NSManagedObjectContext *)aContext;

@property (nonatomic, readonly, copy) NSString *age;

@end
