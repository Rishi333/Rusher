//
//  MapViewController.h
//  Rusher
//
//  Created by Rishi Bommu on 8/1/12.
//  Copyright (c) 2012 Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MApKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController{
 //  BOOL _doneInitialZoom;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
//deleted  the control click for the code from the controller to the MK MAP VIEW 
-(IBAction)directionsPressed:(id)sender;
//-(void)addAnnotation:(id)sender;

@end
