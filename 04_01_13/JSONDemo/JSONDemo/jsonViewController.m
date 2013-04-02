//
//  jsonViewController.m
//  JSONDemo
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "jsonViewController.h"

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
    
    NSString *url = @"http://10.4.172.85/json.php";
    //[self postDataWithUrl:url];
    
    
}


-(NSString *)getTimestamp
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    fseconds = fseconds / 100;
    fseconds = round(fseconds);
    
    
    
    int seconds = (int) floor(fseconds);
    


    
    
    NSString *t =  [NSString stringWithFormat:@"%i", seconds ];
    return t;
}


- (IBAction)LightSwitch1Changed:(id)sender {
    
    
    UISwitch *onSwitch = (UISwitch *) sender;
    if ([onSwitch isOn])
    {
        isSwitch1 = YES;
    }
    else
    {
        isSwitch1 = NO;
    }
    NSString *url = @"http://10.4.172.85/json.php";
    
    //for (int i = 9; i <= 15; i++)
    //{
        
        
        [self postDataWithUrl:url withState:[onSwitch isOn] withID:[NSString stringWithFormat:@"%i",8]];
        
    //}
        
      
    
    

}




- (void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSString *response = [[NSString alloc] initWithData:_httpData encoding:NSUTF8StringEncoding];
    NSLog(@"Response:%@", response);
    
}

- (void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpData appendData:data];
}

- (void) postDataWithUrl:(NSString *) urlString withState:(BOOL) isOn withID:(NSString *) light_id;
{
    _httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postBody = [[NSMutableString alloc] init];
    
    NSString *key = @"asdfasdfsdfg";
    NSString *secret = @"234343434534564";
    NSString *timestamp = [self getTimestamp];
    //NSString *light_id = @"9";
    NSString *state = @"0";
    if (isOn)
    {
        state = @"1";
        
    }
    
    //where we build it
    [postBody appendString:@"{  "];
    [postBody appendFormat:@"\"key\": \"%@\",", key];
    [postBody appendFormat:@"\"secret\": \"%@\",", secret];
    [postBody appendFormat:@"\"timestamp\": \"%@\",", timestamp];
    //opening brace for light element
    [postBody appendString:@"\"light\": {"];
    [postBody appendFormat:@"\"id\": \"%@\",", light_id];
    [postBody appendFormat:@"\"state\": \"%@\"", state];
    //close brace for light element
    [postBody appendString:@"}  "];
    //close brace for outside json
    [postBody appendString:@"}  "];

    NSLog(@"POST BODY:%@", postBody);
    
    
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection  = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

}



@end
