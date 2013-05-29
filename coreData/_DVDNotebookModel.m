// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNotebookModel.m instead.

#import "_DVDNotebookModel.h"

const struct DVDNotebookModelAttributes DVDNotebookModelAttributes = {
	.dateCreated = @"dateCreated",
	.dateModified = @"dateModified",
	.name = @"name",
};

const struct DVDNotebookModelRelationships DVDNotebookModelRelationships = {
	.notes = @"notes",
};

const struct DVDNotebookModelFetchedProperties DVDNotebookModelFetchedProperties = {
};

@implementation DVDNotebookModelID
@end

@implementation _DVDNotebookModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (DVDNotebookModelID*)objectID {
	return (DVDNotebookModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic dateCreated;






@dynamic dateModified;






@dynamic name;






@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	






@end
