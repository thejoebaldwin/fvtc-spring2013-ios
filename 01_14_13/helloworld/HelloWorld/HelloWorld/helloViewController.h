//
//  helloViewController.h
//  HelloWorld
//
//  Created by student on 1/14/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface helloViewController : UIViewController
{
    
    
    __weak IBOutlet UILabel *messageLabel;
    
    
}
@property (weak, nonatomic) IBOutlet UILabel *helloWorldLabel;


@end
