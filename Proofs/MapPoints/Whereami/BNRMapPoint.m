//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "BNRMapPoint.h"


@implementation BNRMapPoint

@synthesize coordinate, title;
- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

- (id)init
{
    return [self initWithCoordinate: CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

@end
