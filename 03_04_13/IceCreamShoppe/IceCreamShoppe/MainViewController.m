//
//  MainViewController.m
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@implementation MainViewController

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self HeaderView];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self HeaderView] bounds].size.height;
}


- (UIView *) HeaderView
{
    if (!_HeaderView)
    {
       [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return _HeaderView;
}

- (IBAction) AddButtonClick:(id) sender
{
    NSLog(@"Add Button Click");
    
    //will call our detail view
    DetailViewController  *detail = [[DetailViewController alloc] init];
    [detail SetIceCreamFlavors:_IceCreamFlavors];
    [detail SetSelectedIndex: -1];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:nil];

    
    
    
}
- (IBAction) DeleteButtonClick:(id) sender
{
    NSLog(@"Delete Button Click");
    if (_deleteMode)
    {
        _deleteMode = NO;
    }
    else
    {
        _deleteMode = YES;
    }
    
    
}


-(void) viewDidAppear:(BOOL)animated
{
    UITableView *view = (UITableView *) [self view];
    [view reloadData];
    
}

-(id) init
{
    self = [super init];
    //add custom initialization
    if (self) {
        //if properly initialized, do this code
        _IceCreamFlavors = [[NSMutableArray alloc] init];
        [_IceCreamFlavors addObject:@"Chocolate"];
        [_IceCreamFlavors addObject:@"Vanilla"];
        [_IceCreamFlavors addObject:@"Strawberry"];
        [_IceCreamFlavors addObject:@"Neopolitan"];
    }
    return self;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_IceCreamFlavors count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    NSString *display = [[NSString alloc] initWithString:[_IceCreamFlavors objectAtIndex:[indexPath row]]];
    [[cell textLabel] setText:display];
    
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_deleteMode)
    {
        //delete selected row and update
        [_IceCreamFlavors removeObjectAtIndex:[indexPath row]];
        UITableView *view = (UITableView *) [self view];
        [view reloadData];
        _deleteMode = NO;
    }
    else
    {
    
    //will call our detail view
    DetailViewController  *detail = [[DetailViewController alloc] init];
    [detail SetIceCreamFlavors:_IceCreamFlavors];
    [detail SetSelectedIndex:[indexPath row]];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:nil];
    }
}



@end
