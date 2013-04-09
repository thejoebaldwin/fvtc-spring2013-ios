//
//  exploderViewController.m
//  StringExploder
//
//  Created by student on 4/8/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "exploderViewController.h"

@interface exploderViewController ()

@end

@implementation exploderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   NSString *board = @"12,1,15,2,9,24,30,22,18,21,34,43,45,31,42,54,50,58,56,55,68,63,70,72,62";
   //split the contents of the string into an array (separated by a ',')
   NSArray* boardNumbers = [board componentsSeparatedByString: @","];
   //loop through array to display, see if it worked
   for (NSString *n in boardNumbers)
   {
       NSLog(@"%@", n);
   }
    
}


- (void) getScreenDimensions
{
    
    int width =  self.view.frame.size.width;
    int height = self.view.frame.size.height;
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
