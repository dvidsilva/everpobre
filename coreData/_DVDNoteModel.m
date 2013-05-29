// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNoteModel.m instead.

#import "_DVDNoteModel.h"

const struct DVDNoteModelAttributes DVDNoteModelAttributes = {
	.content = @"content",
	.dateCreated = @"dateCreated",
	.dateModified = @"dateModified",
	.latitud = @"latitud",
	.longitud = @"longitud",
	.name = @"name",
	.photo = @"photo",
};

const struct DVDNoteModelRelationships DVDNoteModelRelationships = {
	.notebook = @"notebook",
};

const struct DVDNoteModelFetchedProperties DVDNoteModelFetchedProperties = {
};

@implementation DVDNoteModelID
@end

@implementation _DVDNoteModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (DVDNoteModelID*)objectID {
	return (DVDNoteModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"latitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic content;






@dynamic dateCreated;






@dynamic dateModified;






@dynamic latitud;



- (double)latitudValue {
	NSNumber *result = [self latitud];
	return [result doubleValue];
}

- (void)setLatitudValue:(double)value_ {
	[self setLatitud:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudValue {
	NSNumber *result = [self primitiveLatitud];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudValue:(double)value_ {
	[self setPrimitiveLatitud:[NSNumber numberWithDouble:value_]];
}





@dynamic longitud;



- (double)longitudValue {
	NSNumber *result = [self longitud];
	return [result doubleValue];
}

- (void)setLongitudValue:(double)value_ {
	[self setLongitud:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudValue {
	NSNumber *result = [self primitiveLongitud];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudValue:(double)value_ {
	[self setPrimitiveLongitud:[NSNumber numberWithDouble:value_]];
}





@dynamic name;






@dynamic photo;






@dynamic notebook;

	






@end
