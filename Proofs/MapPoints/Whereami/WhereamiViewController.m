//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController



- (void) viewDidLoad
{
    
    CLLocationDegrees lat = 44.284623;
    CLLocationDegrees lon = -88.458494;
    
    CLLocationCoordinate2D fvtcCoords = CLLocationCoordinate2DMake(lat, lon);
    CLLocationCoordinate2D bottomRightCoords = CLLocationCoordinate2DMake(lat + 0.01, lon + 0.01);
    CLLocationCoordinate2D topleftCoords = CLLocationCoordinate2DMake(lat - 0.01, lon - 0.01);
    
    [worldView setCenterCoordinate:fvtcCoords animated:YES];
    [worldView setZoomEnabled:YES];
    
    MKPointAnnotation *fvtcPoint = [[MKPointAnnotation alloc] init];
    [fvtcPoint setCoordinate:fvtcCoords];
    [fvtcPoint setTitle:@"FVTC"];
    
    [worldView addAnnotation:fvtcPoint];
 
    MKMapPoint bottomRightPoint = MKMapPointForCoordinate(bottomRightCoords);
    MKMapPoint topleftPoint = MKMapPointForCoordinate(topleftCoords);
    MKMapRect bottomRightRect = MKMapRectMake(bottomRightPoint.x, bottomRightPoint.y, 1    ,1);
    MKMapRect topLeftRect = MKMapRectMake(topleftPoint.x, topleftPoint.y, 1    ,1);
    MKMapRect zoomRect = MKMapRectUnion(bottomRightRect, topLeftRect);
    
    [worldView setVisibleMapRect:zoomRect animated:YES];
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    MKPointAnnotation *annotation = [mapView.selectedAnnotations lastObject];
    NSString *temp = annotation.title;
    NSLog(@"Selected Annotation:%@", temp);
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
   
    }
    return self;
}














































@end
