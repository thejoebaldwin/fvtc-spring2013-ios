//
//  SectionsViewController.h
//  SectionsAndImages
//
//  Created by Joseph Baldwin on 4/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_NinjaTurtles;
}

@property (weak, nonatomic) IBOutlet UITableView *TMNTTableView;


@end
