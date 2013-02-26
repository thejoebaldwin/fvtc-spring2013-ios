//
//  NewAlbumViewController.m
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "NewAlbumViewController.h"
#import "AlbumItem.h"

@interface NewAlbumViewController ()

@end

@implementation NewAlbumViewController

@synthesize NameField, ArtistField;

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [NameField resignFirstResponder];
    [ArtistField resignFirstResponder];
}


- (void) SetAlbumItems: (NSMutableArray *) items
{
    _albumItems = items;
}

- (NSMutableArray *) AlbumItems
{
    return _albumItems;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddButtonClick:(id)sender {
    
    //add to the data source
    //[_albumItems addObject:[NameField text] ];
    
    AlbumItem *tempAlbum = [[AlbumItem alloc] init];
    [tempAlbum setTitle:[NameField text]];
    [tempAlbum setArtist:[ArtistField text]];
    [_albumItems addObject:tempAlbum];
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];

    
}

- (IBAction)CancelButtonClick:(id)sender {
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
