//
//  ContactItem.m
//  Contacts
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "ContactItem.h"

@implementation ContactItem 


@synthesize FirstName, LastName;



-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:FirstName forKey:@"FirstName"];
    [aCoder encodeObject:LastName forKey:@"LastName"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setFirstName:[aDecoder decodeObjectForKey:@"FirstName"]];
        [self setLastName:[aDecoder decodeObjectForKey:@"LastName"]];
    }
    return self;
}



-(id) initWithFirstName:(NSString *)fName WithLastName:(NSString *)lName
{
    self = [super init];
    
    if (self)
    {
        [self setFirstName:fName];
        [self setLastName:lName];
    }
    
    return self;
}

- (NSString *) description
{
    NSString *display = [[NSString alloc] initWithFormat:@"%@, %@", LastName, FirstName];
    return display;
}


+ (ContactItem *) RandomContact
{
   NSArray *firstNames = [[NSArray alloc] initWithObjects:@"John"
                          ,@"Betty"
                          ,@"Tom"
                          ,@"Tony"
                          ,@"Jeff"
                          , nil];
    
    NSArray *lastNames = [[NSArray alloc] initWithObjects:@"Smith"
                           ,@"Thompson"
                           ,@"Jones"
                           ,@"Roberts"
                           ,@"Paulson"
                           , nil];
    
    int firstNameIndex = arc4random() % [firstNames count];
    int lastNameIndex = arc4random() % [lastNames count];
    
    NSString *firstName = [firstNames objectAtIndex:firstNameIndex];
    NSString *lastName = [lastNames objectAtIndex:lastNameIndex];
    
    ContactItem *tempItem = [[ContactItem alloc] initWithFirstName:firstName WithLastName:lastName];
    return tempItem;
}

    




@end
