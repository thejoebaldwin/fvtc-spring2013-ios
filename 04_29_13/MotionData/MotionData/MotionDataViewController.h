//
//  MotionDataViewController.h
//  MotionData
//
//  Created by Joseph on 4/29/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "Event.h"

@interface MotionDataViewController : UITableViewController
{
    NSMutableArray *_Events;
    NSManagedObjectContext *_ManagedObjectContext;
    float x;
    float y;
    float z;
}

@property (nonatomic, strong) CMMotionManager *MotionManager;
-(void) SetManagedObjectContext:(NSManagedObjectContext *) context;
-(NSManagedObjectContext *) ManagedObjectContext;
-(void) ClearEvents;
-(void) AllEvents;
-(void) AddEvent;


@end
