//
//  MainViewController.m
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "MainViewController.h"

#import "WizardViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tab = [self tabBarItem];
        [tab setTitle:@"Main"];
    
        UIImage *i = [UIImage imageNamed:@"Eket Mask.gif"];
        [tab setImage:i];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StarButtonClick:(id)sender {
    
    WizardViewController *wiz = [[WizardViewController alloc] init];
    [wiz SetWizardStep:1];
    
    [self.navigationController pushViewController:wiz animated:YES];
    
    
}
@end
