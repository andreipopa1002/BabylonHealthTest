// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.h instead.

#import <CoreData/CoreData.h>

extern const struct ContactAttributes {
	__unsafe_unretained NSString *avatarURL;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} ContactAttributes;

extern const struct ContactRelationships {
	__unsafe_unretained NSString *contactDetails;
} ContactRelationships;

@class ContactDetails;

@interface ContactID : NSManagedObjectID {}
@end

@interface _Contact : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ContactID* objectID;

@property (nonatomic, strong) NSString* avatarURL;

//- (BOOL)validateAvatarURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ContactDetails *contactDetails;

//- (BOOL)validateContactDetails:(id*)value_ error:(NSError**)error_;

@end

@interface _Contact (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAvatarURL;
- (void)setPrimitiveAvatarURL:(NSString*)value;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (ContactDetails*)primitiveContactDetails;
- (void)setPrimitiveContactDetails:(ContactDetails*)value;

@end
