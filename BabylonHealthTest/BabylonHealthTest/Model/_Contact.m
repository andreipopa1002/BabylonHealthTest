// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.m instead.

#import "_Contact.h"

const struct ContactAttributes ContactAttributes = {
	.avatarURL = @"avatarURL",
	.contactId = @"contactId",
	.firstName = @"firstName",
	.lastName = @"lastName",
};

const struct ContactRelationships ContactRelationships = {
	.contactDetails = @"contactDetails",
};

@implementation ContactID
@end

@implementation _Contact

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BHContact" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Contact";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:moc_];
}

- (ContactID*)objectID {
	return (ContactID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"contactIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"contactId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic avatarURL;

@dynamic contactId;

- (int64_t)contactIdValue {
	NSNumber *result = [self contactId];
	return [result longLongValue];
}

- (void)setContactIdValue:(int64_t)value_ {
	[self setContactId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveContactIdValue {
	NSNumber *result = [self primitiveContactId];
	return [result longLongValue];
}

- (void)setPrimitiveContactIdValue:(int64_t)value_ {
	[self setPrimitiveContactId:[NSNumber numberWithLongLong:value_]];
}

@dynamic firstName;

@dynamic lastName;

@dynamic contactDetails;

@end

