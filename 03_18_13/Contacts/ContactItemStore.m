//
//  ContactItemStore.m
//  Contacts
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "ContactItemStore.h"

@implementation ContactItemStore


-(id) init
{
    self  = [super init];
    if (self) {
        _AllItems = [[NSMutableArray alloc] init];
    }
    return self;
    
}

- (NSString *) itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(
                                                                      NSDocumentDirectory,
                                                                      NSUserDomainMask,
                                                                      YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"contactitemstore.archive"];
    NSLog(@"Path:%@", path);
    return path;
}


-(void) Save
{
    NSString *path = [self itemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_AllItems toFile:path];
    if (success)
    {
        NSLog(@"Saved:%@", _AllItems);
    }
    else
    {
        NSLog(@"Problem with Save");
    }
    
    
}

-(void) Load
{
    NSString *path = [self itemArchivePath];
    
    _AllItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_AllItems) {
        _AllItems = [[NSMutableArray alloc] init];
    }
    
}


-(NSMutableArray *) AllItems
{
    return _AllItems;
}

-(void) Add:(ContactItem *)item
{
    [_AllItems addObject:item];
}

+(ContactItemStore *) SharedStore
{
    static ContactItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
    
}











@end
