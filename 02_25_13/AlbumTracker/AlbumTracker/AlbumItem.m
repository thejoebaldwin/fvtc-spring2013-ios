//
//  AlbumItem.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "AlbumItem.h"

@implementation AlbumItem

@synthesize Title, Artist;

- (NSString *) description
{
    NSString *descriptionString = [NSString stringWithFormat:@"Title:%@ Artist:%@", Title, Artist];
    
    
    return descriptionString;
}


@end
