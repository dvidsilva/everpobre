#import "_DVDNoteModel.h"

@interface DVDNoteModel : _DVDNoteModel {}
// Custom logic goes here.
+(id) noteInNotebook: (DVDNotebookModel *)aNotebook
             withContext:(NSManagedObjectContext *) aContext;
@end
