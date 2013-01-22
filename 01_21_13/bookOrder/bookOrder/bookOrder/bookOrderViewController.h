//
//  bookOrderViewController.h
//  bookOrder
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookOrderViewController : UIViewController


- (IBAction)submitButtonClick:(id)sender;
- (IBAction)physicalSwitchChanged:(id)sender;
- (IBAction)digitalSwitchChanged:(id)sender;

- (IBAction)quantitySliderChanged:(id)sender;
- (IBAction)nameFieldExit:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *physicalSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *digitalSwitch;

@property (weak, nonatomic) IBOutlet UISlider *quantitySlider;

@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;


@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@end
