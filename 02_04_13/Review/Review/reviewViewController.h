//
//  reviewViewController.h
//  Review
//
//  Created by student on 2/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reviewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;

@property (weak, nonatomic) IBOutlet UILabel *helloLabel2;

- (IBAction)goodbyeButtonClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *goodbyeButton;

- (BOOL) returnYes;

@end
