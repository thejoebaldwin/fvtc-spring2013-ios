//
//  MainViewController.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "MainViewController.h"
#import "NewAlbumViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_albumItems count];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_albumItems objectAtIndex:row];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"InitWithNibName MainViewController");
        _albumItems = [[NSMutableArray alloc] init];
        [_albumItems addObject:@"The White Album"];
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

- (IBAction)AddButtonClick:(id)sender {
    
    
    NewAlbumViewController *navc = [[NewAlbumViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:navc];
    [self presentViewController:navController animated:YES completion:nil];
    
    
    
    
    
    
    
}
@end
