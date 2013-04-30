//
//  SlingShotViewController.h
//  SlingShot
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SlingShotViewController : UIViewController
{
    CAShapeLayer *_CircleLayer;
    BOOL _WasClicked;
    
    CGFloat slingshot_x_range;
    CGFloat slingshot_y_range;
    CGFloat target_y;
    
    CGPoint original_position;
    CAShapeLayer *_TargetLine;
}
@end
