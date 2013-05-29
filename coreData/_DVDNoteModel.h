// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNoteModel.h instead.

#import <CoreData/CoreData.h>


extern const struct DVDNoteModelAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *dateModified;
	__unsafe_unretained NSString *latitud;
	__unsafe_unretained NSString *longitud;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *photo;
} DVDNoteModelAttributes;

extern const struct DVDNoteModelRelationships {
	__unsafe_unretained NSString *notebook;
} DVDNoteModelRelationships;

extern const struct DVDNoteModelFetchedProperties {
} DVDNoteModelFetchedProperties;

@class DVDNotebookModel;







@class NSObject;

@interface DVDNoteModelID : NSManagedObjectID {}
@end

@interface _DVDNoteModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DVDNoteModelID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateCreated;



//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateModified;



//- (BOOL)validateDateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitud;



@property double latitudValue;
- (double)latitudValue;
- (void)setLatitudValue:(double)value_;

//- (BOOL)validateLatitud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitud;



@property double longitudValue;
- (double)longitudValue;
- (void)setLongitudValue:(double)value_;

//- (BOOL)validateLongitud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id photo;



//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) DVDNotebookModel *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;





@end

@interface _DVDNoteModel (CoreDataGeneratedAccessors)

@end

@interface _DVDNoteModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;




- (NSDate*)primitiveDateModified;
- (void)setPrimitiveDateModified:(NSDate*)value;




- (NSNumber*)primitiveLatitud;
- (void)setPrimitiveLatitud:(NSNumber*)value;

- (double)primitiveLatitudValue;
- (void)setPrimitiveLatitudValue:(double)value_;




- (NSNumber*)primitiveLongitud;
- (void)setPrimitiveLongitud:(NSNumber*)value;

- (double)primitiveLongitudValue;
- (void)setPrimitiveLongitudValue:(double)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (id)primitivePhoto;
- (void)setPrimitivePhoto:(id)value;





- (DVDNotebookModel*)primitiveNotebook;
- (void)setPrimitiveNotebook:(DVDNotebookModel*)value;


@end
