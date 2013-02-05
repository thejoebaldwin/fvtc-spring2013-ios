//
//  GraderViewController.m
//  SingleGrader
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "GraderViewController.h"

@interface GraderViewController ()

@end

@implementation GraderViewController


@synthesize gradeField, gradeLabel;


//fires on "tap" gesture
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //tell the gradeField textbox to dismiss it's keyboard
    [gradeField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrGrades = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//define the getGradeLetter function
//  function takes a float named score as argument
- (IBAction)averageButtonClick:(id)sender {
    
    float gradeTotal = 0;
    
    for (int i = 0; i < [arrGrades count]; i++)
    {
        NSNumber *temp = [arrGrades objectAtIndex:i];
        gradeTotal  += [temp floatValue];
    }
    
float finalAverage = gradeTotal / [arrGrades count];
[gradeLabel setText: [NSString stringWithFormat:@"%f", finalAverage]  ];


    
    
    
}

- (NSString *) getGradeLetter:(float) score
{
    //Multiply the score by 100 due to switch not accepting floats
    //  all of our ranges will be mutliplied by 100 also
    //  so 95 to 100 turns into 9500 to 10000
    int switchValue = score * 100;
    NSString *gradeLetter = [[NSString alloc] init];
    
    switch (switchValue) {
        case 9500 ... 10000:
            //set the grade letter to A
            gradeLetter = @"A";
            break;
        case 9200 ... 9499:
            gradeLetter = @"A-";
            
            break;
        case 9000 ... 9199:
            gradeLetter = @"B+";
            break;
        //rest of the grading scale would go here
        // ...
        //Set the grade letter to F to catch all of those values not handled
        //  by above cases
        default:
            gradeLetter = @"F";
            break;
    }
    return gradeLetter;
}


//submit button click
- (IBAction)submitButtonClick:(id)sender {
    
    //get the score entered in the gradeField textbox
    //  need to send the NSString a floatValue message
    //  to get float conversion
    float gradeValue = [[gradeField text] floatValue];
    
    //call the getGradeLetter function. Need to send "self" a "getGradeLetter" message
    NSString *gradeLetter = [self getGradeLetter:gradeValue];
    
    //set the gradeLabel to our gradeLetter NSString
    [gradeLabel setText:gradeLetter];

    
    
    
    //NSLog(@"The most recent score was %f", gradeValue);
    
    NSNumber *wrapperGrade = [[NSNumber alloc] initWithFloat:gradeValue];
    
    [arrGrades addObject:wrapperGrade];
    NSLog(@"%@", arrGrades);
    
}
@end
