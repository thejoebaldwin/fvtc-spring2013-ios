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


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
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
    
    int firstNumber = [[firstNumberField text] intValue];
    int secondNumber = [[secondNumberField text] intValue] ;
    int thirdNumber = [[thirdNumberField text] intValue];
    
    //int total = firstNumber + secondNumber + thirdNumber;
    int total = [self getTotal:firstNumber withSecondNumber:secondNumber withThirdNumber:thirdNumber];
    
    //display the total!
    NSString *totalString = [NSString stringWithFormat:@"%i", total];
    [totalLabel setText:totalString];
    
    NSLog(@"firstNumber:%i secondNumber:%i thirdNumber:%i", firstNumber, secondNumber, thirdNumber);
    
    
       
    
    
    switch (total) {
        case 0 ... 100:
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
