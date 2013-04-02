//
//  jsonViewController.h
//  JSONDemo
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jsonViewController : UIViewController
{
    NSURLConnection *_connection;
    NSMutableData *_httpData;
    bool isSwitch1;
    
    
    
}


- (IBAction)PostButtonClick:(id)sender;
- (IBAction)LightSwitch1Changed:(id)sender;


@end
