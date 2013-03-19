//
//  MainViewController.m
//  Contacts
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "MainViewController.h"
#import "ContactItemStore.h"
#import "ContactItem.h"

@implementation MainViewController

-(id) init
{
    self = [super init];
    if (self)
    {
        //ContactItem *tempItem = [[ContactItem alloc] initWithFirstName:@"John" WithLastName:@"Smith"] ;
        //[[[ContactItemStore SharedStore] AllItems] addObject:[ ContactItem RandomContact]  ];
        //[[[ContactItemStore SharedStore] AllItems] addObject:[ ContactItem RandomContact]  ];
        //[[[ContactItemStore SharedStore] AllItems] addObject:[ ContactItem RandomContact]  ];
        
        
        UIBarButtonItem *AddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddItem)];
        
        [[self navigationItem] setRightBarButtonItem:AddButton];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        

    }
    
    return self;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((editingStyle) == UITableViewCellEditingStyleDelete) {
        
        int index = [indexPath row];
        [[[ContactItemStore SharedStore] AllItems] removeObjectAtIndex:index];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                        withRowAnimation:UITableViewCellEditingStyleDelete];
        
    }
}



-(void) AddItem
{
    [[[ContactItemStore SharedStore] AllItems] addObject:[ContactItem RandomContact]];
    
     
    
    UITableView *tableView = (UITableView *) [self view];
    [tableView reloadData];
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = [[[ContactItemStore SharedStore] AllItems] count];
    
    NSLog(@"Number of rows in Shared Store:%i", count);
    
    return count;
}


-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    int sourceIndex = [sourceIndexPath row];
    int destinationIndex = [destinationIndexPath row];
    
    
    ContactItem *tempItem = [[[ContactItemStore SharedStore] AllItems] objectAtIndex:sourceIndex];
    [[[ContactItemStore SharedStore] AllItems] removeObjectAtIndex:sourceIndex];
    [[[ContactItemStore SharedStore] AllItems] insertObject:tempItem atIndex:destinationIndex];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    ContactItem *tempItem = [[[ContactItemStore SharedStore] AllItems] objectAtIndex:[indexPath row]];
    
    NSString *display = [[NSString alloc] initWithFormat:@"%@", tempItem];
    
    [[cell textLabel] setText:display];
    
    return cell;
}









@end
