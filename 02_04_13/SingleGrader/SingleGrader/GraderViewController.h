//
//  GraderViewController.h
//  SingleGrader
//
//  Created by student on 1/28/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraderViewController : UIViewController
{
    NSMutableArray *arrGrades;
}
- (IBAction)submitButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *gradeField;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
- (IBAction)averageButtonClick:(id)sender;
- (NSString *) getGradeLetter:(float) score;
@end
