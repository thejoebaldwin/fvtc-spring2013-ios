//
//  WebImageViewController.m
//  SectionsAndImages
//
//  Created by Joseph Baldwin on 4/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import "WebImageViewController.h"

@interface WebImageViewController ()

@end

@implementation WebImageViewController
@synthesize NinjaTurtlesImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"WebImage"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //url to web image
    NSString *path = @"http://humboldttechgroup.com/images/tmnt.jpg";
    //create NSURL object from path
    NSURL *url = [NSURL URLWithString:path];
    //load image into NSData
    NSData *data = [NSData dataWithContentsOfURL:url];
 
    //create UIImage with data
    UIImage *image = [[UIImage alloc] initWithData:data];
 
    //set the UIImageView image contents of image
    //Don't forget to set the mode in the xib file attributes inspector!
    //  to get the sizing right (or if your image is fixed width/height
    //  then set the UIImageView accordingly
    [NinjaTurtlesImage setImage:image];
    
    
    //NOTE:
    //  websites do not encourage hotlinking of images
    //  from their websites, as your app is using their images for free
    //  while they are paying for the bandwidth.
    //  use responsibly! webmasters have been known to swap out images
    //  with less than appropriate replacements.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
