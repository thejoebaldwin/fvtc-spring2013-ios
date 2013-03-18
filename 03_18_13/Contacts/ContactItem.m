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



@end
