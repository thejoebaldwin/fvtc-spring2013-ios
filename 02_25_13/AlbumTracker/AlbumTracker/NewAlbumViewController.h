//
//  NewAlbumViewController.h
//  AlbumTracker
//
//  Created by student on 2/25/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewAlbumViewController : UIViewController
{
    NSMutableArray *_albumItems;
}
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *ArtistField;

- (IBAction)AddButtonClick:(id)sender;
- (IBAction)CancelButtonClick:(id)sender;

- (void) SetAlbumItems: (NSMutableArray *) items;
- (NSMutableArray *) AlbumItems;

@end
