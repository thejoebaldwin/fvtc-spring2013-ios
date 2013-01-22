//
//  bookOrderViewController.m
//  bookOrder
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "bookOrderViewController.h"

@interface bookOrderViewController ()

@end

@implementation bookOrderViewController

@synthesize physicalSwitch, digitalSwitch, quantitySlider, sliderValueLabel, submitButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [submitButton setEnabled:YES ];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonClick:(id)sender {
    
    NSLog(@"submitButton Clicked");
}

- (IBAction)physicalSwitchChanged:(id)sender {
    
    NSLog(@"physicalSwitchChanged");
    
    if ([physicalSwitch isOn]) {
        [digitalSwitch setOn:NO animated:YES];
    }
    else {
        [digitalSwitch setOn:YES animated:YES];
    }
}

- (IBAction)digitalSwitchChanged:(id)sender {
    
    if ([digitalSwitch isOn]) {
        [physicalSwitch setOn:NO animated:YES];
    }
    else {
        [physicalSwitch setOn:YES animated:YES];
    }
    
}

- (IBAction)quantitySliderChanged:(id)sender {

    float sliderValue = [quantitySlider value];
    int realSliderValue = (int) roundf(sliderValue);
    
    
    NSLog(@"Quantity Slider Value = %f || int value = %i", sliderValue, realSliderValue);
    
    //create instance of NSString, initialize with format for integer
    NSString *labelString = [[NSString alloc] initWithFormat:@"%i", realSliderValue  ];
    //same result, simpler:
    NSString *labelString_alt = [NSString stringWithFormat:@"i", realSliderValue];
    
    [sliderValueLabel setText:labelString];
    
}

- (IBAction)nameFieldExit:(id)sender {
}
@end
