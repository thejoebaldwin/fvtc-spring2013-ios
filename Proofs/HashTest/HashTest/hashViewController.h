//
//  hashViewController.h
//  HashTest
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hashViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ClearTextField;
@property (weak, nonatomic) IBOutlet UILabel *HashLabel;
- (IBAction)HashButtonClick:(id)sender;

@end
