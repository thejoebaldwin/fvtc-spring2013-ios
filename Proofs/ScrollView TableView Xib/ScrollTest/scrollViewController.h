//
//  scrollViewController.h
//  ScrollTest
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scrollViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_IceCreamFlavors;
    
    
    
}
@property (weak, nonatomic) IBOutlet UILabel *LotsOfLabel;

@end
