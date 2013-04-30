//
//  jsonViewController.m
//  JSONDemo
//
//  Created by student on 4/1/13.
//  Copyright (c) 2013 FVTC. All rights reserved.
//

#import "jsonViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface jsonViewController ()

@end

@implementation jsonViewController



- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
  
    
    
    
    
    
    CGPoint p = [[touches anyObject]  locationInView:[self view] ];
    
        
    
    
    BOOL wasClicked = FALSE;
    
     for (CAShapeLayer *l in self.view.layer.sublayers)
     {
         CGAffineTransform transf = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
         if ([l isKindOfClass:[CAShapeLayer class]])
         {
             if (CGPathContainsPoint(l.path, &transf, p, NO))
             {
                 //I WAS TOUCHED
                 NSLog(@"Layer Touched:%@", l.name);
                 [l setFillColor:[UIColor blueColor].CGColor];
                 l.lineWidth =  l.lineWidth + 5;
                 
                 //l.position.x = l.position.x + 30;
                 
                 //CGPoint newPoint = CGPointMake(l.position.x + 30, l.position.y + 30);
                 //l.position = newPoint;
                 
                 wasClicked = YES;
                 
             }
         }
     
     }
    
    
    if (!wasClicked)
    {
        [_CircleLayer setPosition:p];

    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0,0)];
    [path addLineToPoint:CGPointMake(300, 300)];
    [path closePath];
    [lineLayer setPath:[path CGPath]];
    //[lineLayer setFillColor:[UIColor redColor].CGColor];
    [lineLayer setLineWidth:5];
    [lineLayer setStrokeColor:[UIColor redColor].CGColor];
    [[[self view] layer] addSublayer:lineLayer];
    [lineLayer setName:@"LineLayer"];
    
    
    
    _CircleLayer = [CAShapeLayer layer];
    int radius = 30;
    UIBezierPath *circleBezier = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 40, 40)cornerRadius:radius];
    [_CircleLayer setLineWidth:5];
    [_CircleLayer setStrokeColor:[UIColor blueColor].CGColor];
    [_CircleLayer setPath:[circleBezier CGPath]];
    [_CircleLayer setPosition:CGPointMake(200, 200)];
    [_CircleLayer setName:@"CircleLayer"];
    
     [[[self view] layer] addSublayer:_CircleLayer];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    CATextLayer *label = [[CATextLayer alloc]init];
    [label setFont:@"Helvetica-Bold"];
    [label setFontSize:20];
    [label setString:@"Hello World"];
    [label setFrame:self.view.frame];
    [label setForegroundColor:[[UIColor blackColor] CGColor]];
    [[[self view] layer] addSublayer:label];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PostButtonClick:(id)sender {
    
    NSString *url = @"http://10.4.172.85:8124/";
    //[self postDataWithUrl:url];
    
}


-(NSString *)getTimestamp
{
    float fseconds = [[NSDate date] timeIntervalSince1970];
    fseconds = fseconds / 100;
    fseconds = round(fseconds);
    
    
    
    int seconds = (int) floor(fseconds);
    


    
    
    NSString *t =  [NSString stringWithFormat:@"%i", seconds ];
    return t;
}


- (IBAction)LightSwitch1Changed:(id)sender {
    
    
    UISwitch *onSwitch = (UISwitch *) sender;
    if ([onSwitch isOn])
    {
        isSwitch1 = YES;
    }
    else
    {
        isSwitch1 = NO;
    }
    NSString *url = @"http://10.4.172.85:8124?cmd=control";
    
    //for (int i = 9; i <= 15; i++)
    //{
        
        
        [self postDataWithUrl:url withState:[onSwitch isOn] withID:[NSString stringWithFormat:@"%i",8]];
        
    //}
        
      
    
    

}




- (void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    //NSString *response = [[NSString alloc] initWithData:_httpData encoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_httpData options:kNilOptions error:nil];

    if ([json objectForKey:@"status"])
    {
        NSLog(@"Status is %@", json[@"status"]);
        
    }
    
    if ([json objectForKey:@"lights"])
    {
        
        /*
        for (int i = 0; i < json[@"lights"].length; i++)
        {
            
            
        }
         */
        
        

    }
    
    
    NSLog(@"Response:%@", json);
    
}

- (void) connection:(NSURLConnection *) conn didReceiveData:(NSData *)data
{
    [_httpData appendData:data];
}


-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //retrieve the parent layer out of the animation value bad
    CAShapeLayer *c = (CAShapeLayer *) [anim valueForKey:@"layer"];
    //remove the layer from the parent layer
    [c removeFromSuperlayer];
}


- (void) postDataWithUrl:(NSString *) urlString withState:(BOOL) isOn withID:(NSString *) light_id;
{
    _httpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSMutableString *postBody = [[NSMutableString alloc] init];
    
    NSString *key = @"asdfasdfsdfg";
    NSString *secret = @"234343434534564";
    NSString *timestamp = [self getTimestamp];
    //NSString *light_id = @"9";
    NSString *state = @"off";
    if (isOn)
    {
        state = @"on";
        
    }
    
    //where we build it
    [postBody appendString:@"{  "];
    [postBody appendString:@"\"mode\": \"control\","];
    [postBody appendFormat:@"\"timestamp\": \"%@\",", timestamp];
    //opening brace for light element
    [postBody appendString:@"\"lights\": [{"];
    [postBody appendFormat:@"\"id\": \"%@\",", light_id];
    [postBody appendFormat:@"\"state\": \"%@\"", state];
   
    //close brace for light element
    [postBody appendString:@"}]  "];
    //close brace for outside json
    [postBody appendString:@"}  "];

    NSLog(@"POST BODY:%@", postBody);
    
    
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    _connection  = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

}



@end
