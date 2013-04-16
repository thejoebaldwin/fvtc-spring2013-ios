//
//  jsonStore.m
//  JSONDemo
//
//  Created by Joseph on 4/16/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "jsonStore.h"

@implementation jsonStore


-(id) init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}



//getter for json data
-(NSDictionary *) json
{
    return _json;
}


- (void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    //store json so view controllers can access it when done
    //  Note: if this was a more developed application, we would want to create classes and populate them here
    //  instead of allowing users of our shared store to see the json data directly
    //  Games class, User class, etc.
    _json = [NSJSONSerialization JSONObjectWithData:_httpData options:kNilOptions error:nil];
    //call the completion method on the view controller passed with the initial request function call
    [_CompletionViewController performSelector:NSSelectorFromString(_CompletionMethod)];
}

- (void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpData appendData:data];
}

- (void) postDataWithUrl:(NSString *) urlString withPostBody:(NSString *) postBody withViewController:(UIViewController *) completionViewController withComplete:(NSString *) completionMethod
{
    //set the viewcontroller and method that will be called when request completes
    _CompletionMethod = completionMethod;
    _CompletionViewController = completionViewController;
    
    //make request as normal
    _httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection  = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}

//shared store static method
+(jsonStore *) sharedStore
{
    static jsonStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
    
}

@end
