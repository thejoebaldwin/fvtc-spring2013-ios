//
//  MotionDataViewController.m
//  MotionData
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "MotionDataViewController.h"
#import "Event.h"

@interface MotionDataViewController ()

@end

@implementation MotionDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_Events count];
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"UITableViewCell"];
    Event *event = [_Events objectAtIndex:[indexPath row]];
    NSString *coords = [[NSString alloc] initWithFormat:@"%@,%@,%@", [event x], [event y], [event z]];
    [[cell textLabel] setText:coords];
    return cell;
}

-(void) SetManagedObjectContext:(NSManagedObjectContext *) context
{
    _ManagedObjectContext = context;
}
-(NSManagedObjectContext *) ManagedObjectContext
{
    return _ManagedObjectContext;
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




- (IBAction)AddButtonClick:(id)sender {
    [self AddEvent];
    [EventTable reloadData];
}

- (IBAction)EditButtonClick:(id)sender {
    
}

- (IBAction)ClearButtonClick:(id)sender {
    [self ClearEvents];
        [EventTable reloadData];
}
@end
