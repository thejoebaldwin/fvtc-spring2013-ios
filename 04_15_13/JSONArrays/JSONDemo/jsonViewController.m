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
    
    NSString *url = @"http://bingo.humboldttechgroup.com:1111/?cmd=allgames";
    [self postDataWithUrl:url withPostBody:@""];
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




- (void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSString *response = [[NSString alloc] initWithData:_httpData encoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpData options:kNilOptions error:nil];
    
    //test to see if games element exist
    if ([json objectForKey:@"games"])
    {
        //cast the games element into an array
        NSArray *games = [json objectForKey:@"games"];
        //loop through the games elements
        //  each element is an NSDictionary and can be accessed as suchh
        for (int i = 0; i < games.count;i++)
        {
            //pull out the game_id and win_limit attributes as strings
            NSString *game_id = [games objectAtIndex:i][@"game_id"];
            NSString *win_limit = [games objectAtIndex:i][@"win_limit"];
            
            NSLog(@"game_id:%@,win_limit:%@", game_id, win_limit);
        }
    }
}

- (void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpData appendData:data];
}

- (void) postDataWithUrl:(NSString *) urlString withPostBody:(NSString *) postBody;
{
    _httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection  = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

}





@end
