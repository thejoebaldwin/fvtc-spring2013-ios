//
//  MainViewController.h
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewController : UITableViewController
{
    NSMutableArray *_IceCreamFlavors;
    
    IBOutlet UIView *_HeaderView;
     BOOL _deleteMode;
}

- (UIView *) HeaderView;
- (IBAction) AddButtonClick:(id) sender;
- (IBAction) DeleteButtonClick:(id) sender;

@end
