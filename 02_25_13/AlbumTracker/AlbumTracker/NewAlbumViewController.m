//
//  NewAlbumViewController.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "NewAlbumViewController.h"

@interface NewAlbumViewController ()

@end

@implementation NewAlbumViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddButtonClick:(id)sender {
}

- (IBAction)CancelButtonClick:(id)sender {
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
