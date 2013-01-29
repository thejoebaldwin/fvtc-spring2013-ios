//
//  AdditionViewController.m
//  AdditionCalculator
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "AdditionViewController.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

@synthesize firstNumberField, secondNumberField, thirdNumberField, totalLabel, messageLabel;


//fires on tap gesture
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //tell all the textboxes to dismiss keyboards
    [firstNumberField resignFirstResponder];
    [secondNumberField resignFirstResponder];
    [thirdNumberField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)totalButtonClick:(id)sender {

    //get the user input from each textbox
    int firstNumber = [[firstNumberField text] intValue];
    int secondNumber = [[secondNumberField text] intValue] ;
    int thirdNumber = [[thirdNumberField text] intValue];
    
    //call the getTotal function, passing it all three input values
    int total = [self getTotal:firstNumber withSecondNumber:secondNumber withThirdNumber:thirdNumber];
    
    //convert the total to NSString using format string (%i for integer)
    NSString *totalString = [NSString stringWithFormat:@"%i", total];
    //set the totalLabel label to display the total
    [totalLabel setText:totalString];
    
    //write to log our variable values for debugging
    NSLog(@"firstNumber:%i secondNumber:%i thirdNumber:%i", firstNumber, secondNumber, thirdNumber);
    
    
       
    //switch statement
    //  1...100 will evaluate for any integer from 1 to 100 inclusive
    switch (total) {
        case 0 ... 100:
            //set the message label according to which case we are in
            [messageLabel setText:@"That is a small number"];
            break;
        case 101 ... 200:
            [messageLabel setText:@"Getting Larger!"];
            break;
        default:
            [messageLabel setText:@"That is either a very large or very small number!!!"];
            break;
    }
    
}

- (int) getTotal:(int) firstNumber withSecondNumber:(int) secondNumber withThirdNumber:(int) thirdNumber
{
    int total = firstNumber + secondNumber + thirdNumber;
    
    return total;
}


- (IBAction)firstNumberFieldDone:(id)sender {
}
@end
