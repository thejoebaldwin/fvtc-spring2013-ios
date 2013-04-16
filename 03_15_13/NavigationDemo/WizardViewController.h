//
//  WizardViewController.h
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WizardViewController : UIViewController
{
    
    int _WizardStep;
    
}

-(void) SetWizardStep:(int) i;

- (IBAction)NextButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *StepLabel;
- (IBAction)PreviousButtonClick:(id)sender;

@end
