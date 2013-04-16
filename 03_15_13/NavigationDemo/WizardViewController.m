//
//  WizardViewController.m
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "WizardViewController.h"

@interface WizardViewController ()

@end

@implementation WizardViewController
@synthesize StepLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [StepLabel setText: [NSString stringWithFormat:@"Step #%i", _WizardStep]];
    
    
}

-(void) SetWizardStep:(int) i{
    _WizardStep = i;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)NextButtonClick:(id)sender {
    
    WizardViewController *wiz = [[WizardViewController alloc] init];
    [wiz SetWizardStep: _WizardStep + 1  ];
    
    [self.navigationController pushViewController:wiz animated:YES];
    
}
- (IBAction)PreviousButtonClick:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
