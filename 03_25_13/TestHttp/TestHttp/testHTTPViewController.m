//
//  testHTTPViewController.m
//  TestHttp
//
//  Created by student on 3/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import "testHTTPViewController.h"

@interface testHTTPViewController ()

@end

@implementation testHTTPViewController

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

-(void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [httpData appendData:data];
    
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    //NSLog(@"Received Data:%@", httpData);
    
    NSString *response = [[NSString alloc] initWithData:httpData encoding:NSUTF8StringEncoding];
    NSLog(@"Received Data:%@", response);
    
}

- (IBAction)TestButtonClick:(id)sender {
    
    httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://10.4.134.59/lights.php?=001"];
    //000 = off
    //001 = red
    //100
    //001
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
