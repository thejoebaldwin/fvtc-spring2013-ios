//
//  SectionsViewController.m
//  SectionsAndImages
//
//  Created by Joseph Baldwin on 4/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import "SectionsViewController.h"
#import "NinjaTurtleItem.h"

@interface SectionsViewController ()

@end

@implementation SectionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Sections"];
      
        //initialize array with our turtles
        NinjaTurtleItem *leo = [[NinjaTurtleItem alloc] init];
        [leo SetName:@"Leonardo"];
        [leo SetSkill:@"Katanas"];
        [leo SetColor:[UIColor blueColor]];

        NinjaTurtleItem *raph = [[NinjaTurtleItem alloc] init];
        [raph SetName:@"Raphael"];
        [raph SetSkill:@"Sais"];
        [raph SetColor:[UIColor redColor]];
        
        NinjaTurtleItem *mikey = [[NinjaTurtleItem alloc] init];
        [mikey SetName:@"Michelangelo"];
        [mikey SetSkill:@"Nunchakus"];
        [mikey SetColor:[UIColor orangeColor]];

        NinjaTurtleItem *don = [[NinjaTurtleItem alloc] init];
        [don SetName:@"Donatello"];
        [don SetSkill:@"Bo"];
        [don SetColor:[UIColor purpleColor]];

        _NinjaTurtles = [[NSArray alloc] initWithObjects:leo, raph, mikey, don, nil];
        NSLog(@"Cowabunga!:%@",_NinjaTurtles);
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

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //use the section to determine which section was clicked
    //  use the row to determine which row was selected within that index
    //  this example is using that data to output the corresponding data element on the clicked row
    int row = [indexPath row];
    int section = [indexPath section];
    NinjaTurtleItem *tempNinjaTurtle = (NinjaTurtleItem *) [_NinjaTurtles objectAtIndex:section];
    if (row == 0){
        NSLog(@"%@:%@", [tempNinjaTurtle Name],[tempNinjaTurtle Skill]);
    }
    else if (row == 1) {
        NSLog(@"%@:%@", [tempNinjaTurtle Name],[tempNinjaTurtle NiceColor]);
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Don't forget to set the tableview style to "Grouped" instead of "Plain"
    //  in the xib file attributes inspector!
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    //this method is called for every section, every row depending on what you returned
    //  for numberOfRowsInSection and numberOfSectionsInTableView
    int row = [indexPath row];
    int section = [indexPath section];
    NinjaTurtleItem *tempNinjaTurtle = (NinjaTurtleItem *) [_NinjaTurtles objectAtIndex:section];
    if (row == 0)
    {
        //if row is 0 then set text to skill
        [[cell textLabel] setText:[tempNinjaTurtle Skill]];
    }
    else if (row == 1)
    {
        //if row is 1 then leave the label text blank and set background color to color
        [cell setBackgroundColor:[tempNinjaTurtle Color]];

        //load image from internet
        NSString *path = @"http://humboldttechgroup.com/images/tmnt.jpg";
        //create NSURL object from path
        NSURL *url = [NSURL URLWithString:path];
        //load image into NSData
        NSData *data = [NSData dataWithContentsOfURL:url];
        //create UIImage with data
        UIImage *image = [[UIImage alloc] initWithData:data];
        [[cell imageView] setImage:image];

    }
    return cell;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //1 row for for color and skill
    return 2;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //use the section argument to return the name of the turtle at that index
    NinjaTurtleItem *tempNinjaTurtle = (NinjaTurtleItem *) [_NinjaTurtles objectAtIndex:section];
    return [tempNinjaTurtle Name];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    //we want as many sections as we have turtles
    return [_NinjaTurtles count];
}


@end
