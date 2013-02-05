//
//  reviewViewController.m
//  Review
//
//  Created by student on 2/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "reviewViewController.h"

@interface reviewViewController ()

@end

@implementation reviewViewController


@synthesize helloLabel, goodbyeButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int i = 1;
    int j = i + 2;
    NSString *test = [NSString stringWithFormat:@"Hello There %i", 99];
    
    
    //hi there everybody!
    [helloLabel setText:@"Hi There Everybody"];
    
    [self returnYes];
    
    
    //declare a string that says "iOS Quiz #1"
    NSString *iosQuiz = @"iOS Quiz #1";
    //write this string to the log file
    //write to the log "the message is:" + the nsstring
    NSLog(@"The Message Is:%@ Error Count:%i",  iosQuiz, 99);
    
}

- (BOOL) returnYes
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goodbyeButtonClick:(id)sender {
    
    [helloLabel setText:@"Goodbye"];
    //[goodbyeButton setHidden:YES];
    [goodbyeButton setTitle:@"Off" forState:UIControlStateNormal];
    
}
@end
