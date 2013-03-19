//
//  ContactItemStore.h
//  Contacts
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactItem.h"

@interface ContactItemStore : NSObject
{
    NSMutableArray *_AllItems;
    
}

-(void) Add:(ContactItem *) item;
-(NSMutableArray *) AllItems;
+(ContactItemStore *) SharedStore;

- (void) Save;
- (void) Load;


@end
