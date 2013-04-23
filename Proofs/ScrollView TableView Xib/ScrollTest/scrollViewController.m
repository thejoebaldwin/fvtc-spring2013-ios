//
//  scrollViewController.m
//  ScrollTest
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "scrollViewController.h"

@interface scrollViewController ()

@end

@implementation scrollViewController
@synthesize LotsOfLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _IceCreamFlavors = [[NSMutableArray alloc] init];
    [_IceCreamFlavors addObject:@"Chocolate"];
    [_IceCreamFlavors addObject:@"Vanilla"];
    
    
    
    NSMutableString *lotsOfText = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 100; i++)
    {
        
        [lotsOfText appendString:@"Lorem Ipsum\n"];
        
    }
    
    
    [LotsOfLabel setText:lotsOfText];
    
    
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_IceCreamFlavors count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    int index = [indexPath row];
    
    
    [[cell textLabel] setText:[_IceCreamFlavors objectAtIndex:index]];
    
    return cell;
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
