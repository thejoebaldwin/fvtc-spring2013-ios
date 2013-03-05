//
//  DetailViewController.h
//  IceCreamShoppe
//
//  Created by student on 3/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSMutableArray *_IceCreamFlavors;
    NSInteger _SelectedIndex;
   
}

- (void) SetSelectedIndex:(NSInteger) index;
- (void) SetIceCreamFlavors:(NSMutableArray *) array;

- (IBAction)SubmitButtonClick:(id)sender;
- (IBAction)CancelButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *FlavorField;

@end
