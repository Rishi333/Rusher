//
//  MapViewController.m
//  Rusher
//
//  Created by Rishi Bommu on 8/1/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import "MapViewController.h"
#import "FlipsideViewController.h"


@interface MapViewController ()
@property (nonatomic, strong) FlipsideViewController *flipper;
@property (nonatomic,strong) MKPointAnnotation *director;
@property (nonatomic) BOOL *directionsEntered;


@end

@implementation MapViewController
UISegmentedControl *buttonBarSegmentedControl;  
@synthesize directionsEntered;
@synthesize director;
@synthesize mapView;
@synthesize flipper=_flipper;

/*-(void)addAnnotation:(id)placemarks{
    CLPlacemark *topResult = [placemarks objectAtIndex:0];
    MKPlacemark *placemark = [[MKPlacemark alloc]initWithPlacemark:topResult];
    MKCoordinateRegion region = self.mapView.region;
    region.center = placemark.region.center;
    region.span.longitudeDelta /= 8.0;
    region.span.latitudeDelta /= 8.0;    
    [self.mapView setRegion:region animated:YES];
    [self.mapView addAnnotation:placemark];
    NSLog(@"lad;fgjalsfkjdghldkfj");
}*/

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
    NSLog(@"mapview method initiated");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    
    buttonBarSegmentedControl = [[UISegmentedControl alloc] initWithItems:  
                                 [NSArray arrayWithObjects:@"Standard", @"Satellite", @"Hybrid", nil]];  
    [buttonBarSegmentedControl setFrame:CGRectMake(30, 10, 280-30, 30)];  
    buttonBarSegmentedControl.selectedSegmentIndex = 0.0;   // start by showing the normal picker  
    [buttonBarSegmentedControl addTarget:self action:@selector(toggleToolBarChange:) forControlEvents:UIControlEventValueChanged];  
    buttonBarSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;  
    buttonBarSegmentedControl.backgroundColor = [UIColor blackColor];  
    [buttonBarSegmentedControl setAlpha:50];  
    
    [self.mapView addSubview:buttonBarSegmentedControl];  
    
    
    
    
    
    [super viewDidLoad];
    mapView.showsUserLocation = YES;
     NSLog(@"view did load");
       [self.view addSubview:mapView];
    [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:TRUE];
	// Do any additional setup after loading the view.
}

- (void)toggleToolBarChange:(id)sender  
{  
    UISegmentedControl *segControl = sender;  
    
    switch (segControl.selectedSegmentIndex)  
    {  
        case 0: // Map  
        {  
            [mapView setMapType:MKMapTypeStandard];  
            break;  
        }  
        case 1: // Satellite  
        {  
            [mapView setMapType:MKMapTypeSatellite];  
            break;  
        }  
        case 2: // Hybrid  
        {  
            [mapView setMapType:MKMapTypeHybrid];  
            break;  
        }  
    }  
}  
-(IBAction)directionsPressed:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.google.com/maps"]];
    
    NSLog(@"maps has been clicked");

}
- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
