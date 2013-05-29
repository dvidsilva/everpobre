// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNotebookModel.h instead.

#import <CoreData/CoreData.h>


extern const struct DVDNotebookModelAttributes {
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *dateModified;
	__unsafe_unretained NSString *name;
} DVDNotebookModelAttributes;

extern const struct DVDNotebookModelRelationships {
	__unsafe_unretained NSString *notes;
} DVDNotebookModelRelationships;

extern const struct DVDNotebookModelFetchedProperties {
} DVDNotebookModelFetchedProperties;

@class DVDNoteModel;





@interface DVDNotebookModelID : NSManagedObjectID {}
@end

@interface _DVDNotebookModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DVDNotebookModelID*)objectID;





@property (nonatomic, strong) NSDate* dateCreated;



//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateModified;



//- (BOOL)validateDateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;





@end

@interface _DVDNotebookModel (CoreDataGeneratedAccessors)

- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(DVDNoteModel*)value_;
- (void)removeNotesObject:(DVDNoteModel*)value_;

@end

@interface _DVDNotebookModel (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;




- (NSDate*)primitiveDateModified;
- (void)setPrimitiveDateModified:(NSDate*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;


@end
