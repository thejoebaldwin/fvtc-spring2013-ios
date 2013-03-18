//
//  ContactItem.h
//  Contacts
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactItem : NSObject


@property (nonatomic, retain) NSString *FirstName;
@property (nonatomic, retain) NSString *LastName;

-(id) initWithFirstName:(NSString *) fName WithLastName:(NSString *) lName;

@end
