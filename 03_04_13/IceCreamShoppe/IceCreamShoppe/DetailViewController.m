//
//  DetailViewController.m
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize FlavorField;


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [FlavorField resignFirstResponder];
}


- (void) SetSelectedIndex:(NSInteger) index
{
    _SelectedIndex = index;
}


- (void) SetIceCreamFlavors:(NSMutableArray *) array
{
    _IceCreamFlavors = array;
}




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
    if (_SelectedIndex == -1)
    {
        //do nothing
        
    }
    else
    {
        [FlavorField setText:[_IceCreamFlavors objectAtIndex:_SelectedIndex]];
    }
}

/*
- (void) viewDidAppear:(BOOL)animated
{
    
    
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SubmitButtonClick:(id)sender {
    
    NSString *newFlavor = [FlavorField text];
    
    if (_SelectedIndex == -1)
    {
        //add new flavor
        [_IceCreamFlavors addObject:newFlavor];
    }
    else
    {
        //edit existing flavor
        [_IceCreamFlavors setObject:newFlavor atIndexedSubscript:_SelectedIndex];
    }

    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)CancelButtonClick:(id)sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];

}
@end
