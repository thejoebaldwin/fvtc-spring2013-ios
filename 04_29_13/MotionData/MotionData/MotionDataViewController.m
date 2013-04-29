//
//  MotionDataViewController.m
//  MotionData
//
//  Created by Joseph on 4/29/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "MotionDataViewController.h"

@interface MotionDataViewController ()

@end

@implementation MotionDataViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _Events = [[NSMutableArray alloc] init];
        
        self.MotionManager = [[CMMotionManager alloc] init];
        
        if ([self.MotionManager isAccelerometerAvailable]) {
            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
            [[self MotionManager] startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                
                x = accelerometerData.acceleration.x;
                y = accelerometerData.acceleration.y;
                z = accelerometerData.acceleration.z;
                
            }];
        }
        else {
            NSLog(@"Accelerometer Data is not available");
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
       }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_Events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
      
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}





-(void) ClearEvents
{
    while ([_Events count] > 0)
    {
        Event *event = [_Events lastObject];
        [_ManagedObjectContext deleteObject:event];
        [_Events removeLastObject];
    }
    
    NSError *error = nil;
    
    if (![_ManagedObjectContext save:&error]) {
        //handle the error
        NSLog(@"%@", error);
    }
    else {
        NSLog(@"Deleted Successfully");
    }
}


-(void) AllEvents
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:_ManagedObjectContext];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"session" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[_ManagedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil)
    {
        NSLog(@"%@", error);
    }
    _Events = mutableFetchResults;
}

-(void) AddEvent
{
    Event *event = (Event *) [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext: _ManagedObjectContext];
    
    [event setX:[[NSNumber alloc] initWithFloat:x]];
    [event setY:[[NSNumber alloc] initWithFloat:y]];
    [event setZ:[[NSNumber alloc] initWithFloat:z]];
     
    NSError *error = nil;
    if (![_ManagedObjectContext save:&error]) {
        //handle the error
        NSLog(@"%@", error);
    }
    else {
        NSLog(@"Saved Successfully");
    }
    
    [self AllEvents];
}

@end
