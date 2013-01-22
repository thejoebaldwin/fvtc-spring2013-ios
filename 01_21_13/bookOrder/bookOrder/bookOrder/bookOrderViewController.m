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
        //[digitalSwitch setOn:NO];
        [digitalSwitch setOn:NO animated:NO];
    }
    else {
        //[digitalSwitch setOn: YES];
        [digitalSwitch setOn:YES animated:YES];
        
    }
        
    
        
    
    
    
    
}

- (IBAction)digitalSwitchChanged:(id)sender {
}

- (IBAction)quantitySliderChanged:(id)sender {
    
   //[quantitySlider value]
    float sliderValue = [quantitySlider value];
    int realSliderValue = (int) roundf(sliderValue);
    
    
    NSLog(@"Quantity Slider Value = %f || int value = %i", sliderValue, realSliderValue);
    
    NSString *labelString = [[NSString alloc] initWithFormat:@"%i", realSliderValue  ];
    
    [sliderValueLabel setText:labelString];
    
}

- (IBAction)nameFieldExit:(id)sender {
}
@end
