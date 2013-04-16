//
//  jsonStore.h
//  JSONDemo
//
//  Created by Joseph on 4/16/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonStore : NSObject
{
    NSURLConnection *_connection;
    NSMutableData *_httpData;
    NSDictionary *_json;

    UIViewController *_CompletionViewController;
    NSString *_CompletionMethod;

}


+(jsonStore *) sharedStore;

-(NSDictionary *) json;
- (void) postDataWithUrl:(NSString *) urlString withPostBody:(NSString *) postBody withViewController:(UIViewController *) completionViewController withComplete:(NSString *) completionMethod;
@end
