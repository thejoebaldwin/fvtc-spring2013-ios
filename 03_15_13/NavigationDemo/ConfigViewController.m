//
//  ConfigViewController.m
//  NavigationDemo
//
//  Created by student on 4/15/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "ConfigViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ConfigViewController ()

@end

@implementation ConfigViewController


//this will fire on animation completion
-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //retrieve the parent layer out of the animation value bad
    CAShapeLayer *c = (CAShapeLayer *) [anim valueForKey:@"layer"];
    //remove the layer from the parent layer
    [c removeFromSuperlayer];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the point where touch move ocurred
    CGPoint p = [[touches anyObject]  locationInView:self.view ];
    //create layer to draw on
    CAShapeLayer *tempCircle = [CAShapeLayer layer];
    //create the drawing
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0, 10, 10) cornerRadius:10];
    //set the drawing to the layer
    [tempCircle setPath:circlePath.CGPath];
    //set the fill color of the drawing
    [tempCircle setFillColor:[UIColor redColor].CGColor];
    //set the position of the layer
    [tempCircle setPosition:p];
    //create the animation object, that will animate the "position" property
    CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    //set the starting value of the animation
    [translateAnimation setFromValue:[NSValue valueWithCGPoint:p]];
    //set the stop value of the animation
    [translateAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(p.x + 40, p.y)]];

    
    //TO REMOVE THE SHAPE AFTER ANIMATION COMPLETES!
    
    //set delegate to self, so animationDidStop is fired
    [translateAnimation setDelegate:self];
    //setValue to the layer this animation will be added to.
    //  this is to retrieve later as the layer is not accessible through
    //  the animation object
    [translateAnimation setValue:tempCircle forKeyPath:@"layer"];

    //add the animation to the circle layer
    [tempCircle addAnimation:translateAnimation forKey:@"basic"];
    //add the layer to the parent layer
    [[[self view] layer] addSublayer:tempCircle];
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UITabBarItem *tab = [self tabBarItem];
        [tab setTitle:@"Config"];
        
        
        UIImage *i = [UIImage imageNamed:@"Rukai Mask.gif"];
//        [i resizingMode:UIViewContentModeScaleAspectFit];
    //    [i resizingMode: UIViewContentModeScaleAspectFit];
        [tab setImage:i];
        
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

@end
