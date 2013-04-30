//
//  SlingShotViewController.m
//  SlingShot
//
//  Created by student on 4/29/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "SlingShotViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface SlingShotViewController ()

@end

@implementation SlingShotViewController

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_WasClicked) {
     CAShapeLayer *Bullet = [CAShapeLayer layer];
     UIBezierPath *BulletBezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 15, 15)cornerRadius:10];
     [Bullet setLineWidth:0];
     [Bullet setFillColor:[UIColor whiteColor].CGColor];
     [Bullet setPath:[BulletBezier CGPath]];
    
     CGPoint slingshot = [_CircleLayer position];
     CGFloat slope = (slingshot.y - original_position.y) / (slingshot.x - original_position.x);
     
     CGFloat target_x = (target_y) / slope * -1;
     CGPoint targetPoint = CGPointMake(target_x, target_y);

     [Bullet setPosition:[_CircleLayer position]];
     [Bullet setName:@"BulletLayer"];
     [[[self view] layer] addSublayer:Bullet];

     [_CircleLayer setFillColor:[UIColor blueColor].CGColor];
     [_CircleLayer setPosition:original_position];
     
     CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
     //set the starting value of the animation
     [translateAnimation setFromValue:[NSValue valueWithCGPoint:[_CircleLayer position]]];
     //set the stop value of the animation
     [translateAnimation setToValue:[NSValue valueWithCGPoint:targetPoint]];
     [translateAnimation setDelegate:self];
     [translateAnimation setValue:Bullet forKeyPath:@"layer"];
     [Bullet addAnimation:translateAnimation forKey:@"basic"];
    }
   _WasClicked = NO;
}



- (CGFloat) pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint) endingPoint
{
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y); // get origin point to origin by subtracting end from start
    float bearingRadians = atan2f(originPoint.y, originPoint.x); // get bearing in radians
    float bearingDegrees = bearingRadians * (180.0 / M_PI); // convert to degrees
    bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees)); // correct discontinuity
    return bearingDegrees;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_WasClicked)
    {
        CGFloat x = [_CircleLayer position].x;
        CGFloat y = [_CircleLayer position].y;
        CGPoint p = [[touches anyObject]  locationInView:[self view] ];
        if (p.y < original_position.y + slingshot_y_range && p.y > original_position.y - slingshot_y_range)
        {
            y = p.y;
        }
        if (p.x < original_position.x + slingshot_x_range && p.x > original_position.x - slingshot_x_range)
        {
            x = p.x;
        }
        [_CircleLayer setPosition:CGPointMake(x, y)];
     }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject]  locationInView:[self view] ];
    for (CAShapeLayer *l in self.view.layer.sublayers)
    {
        CGAffineTransform transf = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
        if ([l isKindOfClass:[CAShapeLayer class]])
        {
            if (CGPathContainsPoint(l.path, &transf, p, NO))
            {
                //I WAS TOUCHED
                [l setFillColor:[UIColor redColor].CGColor];
                _WasClicked = YES;
            }
        }
    }
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //retrieve the parent layer out of the animation value bad
    CAShapeLayer *c = (CAShapeLayer *) [anim valueForKey:@"layer"];
    //remove the layer from the parent layer
    [c removeFromSuperlayer];
    
    
    CGFloat newWidth = [_TargetLine lineWidth];
    [_TargetLine setLineWidth:newWidth + 1];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    
    slingshot_x_range = 100;
    slingshot_y_range = 50;
    
    float center_x = self.view.layer.bounds.size.width / 2;
    float bottom_y = (self.view.layer.bounds.size.height / 3) * 2;
    target_y = (self.view.layer.bounds.size.height / 6);
    
    CGPoint start = CGPointMake(center_x, bottom_y);
    original_position = start;
    NSLog(@"Start Position:%f,%f", start.x, start.y);
    
    CAShapeLayer *StartPoint = [CAShapeLayer layer];
    UIBezierPath *StartBezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 15, 15)cornerRadius:10];
    [StartPoint setLineWidth:0];
    [StartPoint setFillColor:[UIColor yellowColor].CGColor];
    [StartPoint setPath:[StartBezier CGPath]];
    [StartPoint setPosition:start];
    [StartPoint setName:@"StartLayer"];
    [[[self view] layer] addSublayer:StartPoint];

    
    _CircleLayer = [CAShapeLayer layer];
    UIBezierPath *circleBezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 40, 40)cornerRadius:30];
    [_CircleLayer setLineWidth:5];
    [_CircleLayer setStrokeColor:[UIColor blueColor].CGColor];
    [_CircleLayer setPath:[circleBezier CGPath]];
    [_CircleLayer setPosition:start];
    [_CircleLayer setName:@"CircleLayer"];
    [[[self view] layer] addSublayer:_CircleLayer];
    
    
    _TargetLine = [CAShapeLayer layer];
    
    UIBezierPath *targetLinePath = [UIBezierPath bezierPath];
    [targetLinePath moveToPoint:CGPointMake(0,target_y)];
    [targetLinePath addLineToPoint:CGPointMake( self.view.layer.bounds.size.width, target_y)];
    [targetLinePath closePath];
    [_TargetLine setPath: [targetLinePath CGPath]];
    [_TargetLine setLineWidth:5];
    [_TargetLine setStrokeColor:[UIColor redColor].CGColor];
    [[[self view] layer] addSublayer:_TargetLine];
    [_TargetLine setName:@"LineLayer"];
   
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
