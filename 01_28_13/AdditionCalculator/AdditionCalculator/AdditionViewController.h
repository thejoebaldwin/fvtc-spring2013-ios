//
//  AdditionViewController.h
//  AdditionCalculator
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdditionViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *firstNumberField;
@property (weak, nonatomic) IBOutlet UITextField *secondNumberField;
@property (weak, nonatomic) IBOutlet UITextField *thirdNumberField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
- (IBAction)totalButtonClick:(id)sender;
- (IBAction)firstNumberFieldDone:(id)sender;
- (int) getTotal:(int) firstNumber withSecondNumber:(int) secondNumber withThirdNumber:(int) thirdNumber;
- (int) getTotal:(int) firstNumber withSecondNumber:(int) secondNumber;
- (int) getTotal:(int) firstNumber;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
