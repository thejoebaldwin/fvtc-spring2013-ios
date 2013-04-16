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
    NSString *_login;
    NSString *_user_id;
    
    
}


- (IBAction)PostButtonClick:(id)sender;


- (IBAction)CreateUserClick:(id)sender;
- (IBAction)JoinGameClick:(id)sender;
- (IBAction)GetNumberClick:(id)sender;
- (IBAction)AllUsersClick:(id)sender;

@end
