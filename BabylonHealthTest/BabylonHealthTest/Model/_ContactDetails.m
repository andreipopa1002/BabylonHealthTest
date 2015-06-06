// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ContactDetails.m instead.

#import "_ContactDetails.h"

const struct ContactDetailsAttributes ContactDetailsAttributes = {
	.address = @"address",
	.createdAt = @"createdAt",
	.email = @"email",
	.phoneNumber = @"phoneNumber",
	.updatedAt = @"updatedAt",
};

const struct ContactDetailsRelationships ContactDetailsRelationships = {
	.contact = @"contact",
};

@implementation ContactDetailsID
@end

@implementation _ContactDetails

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ContactDetails" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ContactDetails";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ContactDetails" inManagedObjectContext:moc_];
}

- (ContactDetailsID*)objectID {
	return (ContactDetailsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic address;

@dynamic createdAt;

@dynamic email;

@dynamic phoneNumber;

@dynamic updatedAt;

@dynamic contact;

@end

