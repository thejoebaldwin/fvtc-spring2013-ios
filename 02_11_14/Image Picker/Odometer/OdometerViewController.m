//
//  OdometerViewController.m
//  Odometer
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "OdometerViewController.h"

@interface OdometerViewController ()

@end

@implementation OdometerViewController


@synthesize pickerView;

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
 //executes when a new row is selected
    NSLog(@"Row:%i Component:%i", row, component);
    
    
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //will return the number of rows displayed in the picker
   // return [arrNumbers count];
    return 20;
}

- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    NSString *filePath;
    if (component == 0) {
        filePath = @"heart";
    } else if (component == 1)
    {
        filePath = @"clubs";
    }
 else if (component == 2)
{
    filePath = @"diamond";
}
 else if (component == 3)
 {
     filePath = @"spade";
 }
    UIImage *tempImage = [UIImage imageNamed:filePath];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:tempImage];
    [imageView setFrame:CGRectMake(0,0, 30, 30)];
    return (UIView *) imageView;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //number of "dials" displayed in the picker
    return 4;
}

/*
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    int displayNumber = [[arrNumbers objectAtIndex:row] intValue];
    
    NSString *display = [NSString stringWithFormat:@"%i", displayNumber];
    
    return display;
}

 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrNumbers = [[NSArray alloc] initWithObjects: [NSNumber numberWithInt:0],
                  [NSNumber numberWithInt:1],
                  [NSNumber numberWithInt:2],
                  [NSNumber numberWithInt:3],
                  [NSNumber numberWithInt:4],
                  [NSNumber numberWithInt:5],
                  [NSNumber numberWithInt:6],
                  [NSNumber numberWithInt:7],
                  [NSNumber numberWithInt:8],
                  [NSNumber numberWithInt:9],
                  nil   ];
    
    counter = 97;
    
    //[pickerView setUserInteractionEnabled:NO];
    
}

- (void) tick:(NSTimer *) timer
{
    counter++;
    //if (counter > 9) {
    //    counter = 0;
    //}
    [pickerView selectRow:counter % 10 inComponent:2 animated:YES];
    [pickerView selectRow: (counter / 10) % 10 inComponent:1 animated:YES];
    [pickerView selectRow: (counter / 100) % 10 inComponent:0 animated:YES];
}


- (void) startTimer {
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(tick:)
                                   userInfo:nil
                                    repeats:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonClick:(id)sender {
    
    [self startTimer];

        
    
}
@end
