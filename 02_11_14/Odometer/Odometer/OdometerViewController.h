//
//  OdometerViewController.h
//  Odometer
//
//  Created by student on 2/11/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OdometerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *arrNumbers;
    int counter;
    
}
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)addButtonClick:(id)sender;

@end
