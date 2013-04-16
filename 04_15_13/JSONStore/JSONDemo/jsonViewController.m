//
//  jsonViewController.m
//  JSONDemo
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "jsonViewController.h"
#import "jsonStore.h"

@interface jsonViewController ()

@end

@implementation jsonViewController

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


- (IBAction)PostButtonClick:(id)sender {
    
    NSString *url = @"http://bingo.humboldttechgroup.com:1111/?cmd=allgames";
    
    //pass the current view controller, and a string representing the method to call when
    //  request is complete.
    //  NOTE: this will not work (as is) with a method that takes parameters or has
    //  a return type!
    
    [[jsonStore sharedStore] postDataWithUrl:url withPostBody:@"" withViewController:self withComplete:@"requestComplete"];
}

-(void) requestComplete
{
    //request is complete, so get stored json from the shared store
    NSDictionary *json = [[jsonStore sharedStore] json];
    //output json to console
    NSLog(@"%@",json);
    
}





@end
