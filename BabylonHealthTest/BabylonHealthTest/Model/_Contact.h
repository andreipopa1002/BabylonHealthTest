// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.h instead.

#import <CoreData/CoreData.h>

extern const struct ContactAttributes {
	__unsafe_unretained NSString *avatarURL;
	__unsafe_unretained NSString *contactId;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} ContactAttributes;

extern const struct ContactRelationships {
	__unsafe_unretained NSString *contactDetails;
} ContactRelationships;

@class BHContactDetails;

@interface ContactID : NSManagedObjectID {}
@end

@interface _Contact : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ContactID* objectID;

@property (nonatomic, strong) NSString* avatarURL;

//- (BOOL)validateAvatarURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* contactId;

@property (atomic) int64_t contactIdValue;
- (int64_t)contactIdValue;
- (void)setContactIdValue:(int64_t)value_;

//- (BOOL)validateContactId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BHContactDetails *contactDetails;

//- (BOOL)validateContactDetails:(id*)value_ error:(NSError**)error_;

@end

@interface _Contact (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAvatarURL;
- (void)setPrimitiveAvatarURL:(NSString*)value;

- (NSNumber*)primitiveContactId;
- (void)setPrimitiveContactId:(NSNumber*)value;

- (int64_t)primitiveContactIdValue;
- (void)setPrimitiveContactIdValue:(int64_t)value_;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (BHContactDetails*)primitiveContactDetails;
- (void)setPrimitiveContactDetails:(BHContactDetails*)value;

@end
