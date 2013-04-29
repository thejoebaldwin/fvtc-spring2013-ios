//
//  MotionDataViewController.h
//  MotionData
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface MotionDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAccelerometerDelegate>
{
    
    NSMutableArray *_Events;
    NSManagedObjectContext *_ManagedObjectContext;
    float x;
    float y;
    float z;
    
    __weak IBOutlet UITableView *EventTable;
}

@property (nonatomic, strong) CMMotionManager *MotionManager;
-(void) SetManagedObjectContext:(NSManagedObjectContext *) context;
-(NSManagedObjectContext *) ManagedObjectContext;

- (IBAction)AddButtonClick:(id)sender;
- (IBAction)EditButtonClick:(id)sender;
- (IBAction)ClearButtonClick:(id)sender;

@end
