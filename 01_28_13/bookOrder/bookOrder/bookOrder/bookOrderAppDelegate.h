//
//  bookOrderAppDelegate.h
//  bookOrder
//
//  Created by student on 1/21/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class bookOrderViewController;

@interface bookOrderAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) bookOrderViewController *viewController;

@end
